<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                       ->description()
                       ->schema([
                           Section::make('User name')
                               ->columns([
                                   'sm' => 1,
                                   'xl' => 2,
                                   '2xl' => 2,
                               ])
                                  ->schema([
                                      TextInput::make('f_name')->label('First name'),
                                      TextInput::make('l_name')->label('Last name'),
                                  ]),
                           Section::make('User address')
                               ->columns([
                                   'sm' => 1,
                                   'xl' => 3,
                                   '2xl' => 3,
                               ])
                                  ->schema([
                                      TextInput::make('city'),
                                      TextInput::make('street'),
                                      TextInput::make('n_house')->label('House number'),
                                  ]),
                           TextInput::make('email')->email(),
                           TextInput::make('password')
                                    ->helperText('Leave the password field empty to keep the current password unchanged')
                                    ->password()
                                    ->dehydrateStateUsing(fn($state) => Hash::make($state))
                                    ->dehydrated(fn($state) => filled($state))
                                    ->required(fn(string $context): bool => $context === 'create'),
                           TextInput::make('mobile'),
                           Select::make('roles')->multiple()->relationship('roles', 'name'),
                           SpatieMediaLibraryFileUpload::make('profile_image'),
                       ]),

            ]);
    }

    public static function canViewAny(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\SpatieMediaLibraryImageColumn::make('profile_image')->label('Image')->circular()->toggleable()->stacked()->wrap(),
                TextColumn::make('name'),
                TextColumn::make('email'),
                TextColumn::make('mobile'),
                TextColumn::make('address')->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('created_at')->toggleable(isToggledHiddenByDefault: true)->dateTime(),
                TextColumn::make('updated_at')->toggleable(isToggledHiddenByDefault: true)->dateTime(),
                TextColumn::make('roles.name')->listWithLineBreaks(),
            ])
            ->filters([
                Filter::make('email_verified_at')->label('Email verified')->query(function (Builder $query): Builder {
                    return $query->whereNotNull('email_verified_at');
                }),
                Filter::make('created_at')
                      ->form([
                          DatePicker::make('created_from'),
                          DatePicker::make('created_until'),
                      ])
                      ->query(function (Builder $query, array $data): Builder {
                          return $query
                              ->when(
                                  $data['created_from'],
                                  fn(Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                              )
                              ->when(
                                  $data['created_until'],
                                  fn(Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                              );
                      }),
                TrashedFilter::make('trashed'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\ForceDeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->modifyQueryUsing(fn(Builder $query) => $query->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]));
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit'   => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
