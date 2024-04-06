<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('roles')->delete();
        
        \DB::table('roles')->insert(array (
            0 =>
            array (
                'id' => 1,
                'name' => 'admin',
                'guard_name' => 'web',
                'created_at' => '2023-11-07 02:24:32',
                'updated_at' => '2023-11-07 02:24:32',
            ),
            1 =>
            array (
                'id' => 2,
                'name' => 'user',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:14:57',
                'updated_at' => '2024-03-10 08:15:06',
            ),
            2 =>
            array (
                'id' => 3,
                'name' => 'moderator',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 14:01:33',
                'updated_at' => '2024-03-10 14:01:33',
            ),
        ));
    }
}
