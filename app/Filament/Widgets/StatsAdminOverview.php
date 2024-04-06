<?php

namespace App\Filament\Widgets;

use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsAdminOverview extends BaseWidget
{
    protected function getStats(): array
    {
        $result[] = Stat::make('Total Users Registered', User::count())
                        ->icon('heroicon-m-users')
                        ->description('The total number of users that registered into the system.');

        return $result;
    }
}
