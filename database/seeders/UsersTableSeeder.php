<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('users')->delete();

        \DB::table('users')->insert(array (
            0 =>
            array (
                'id' => 1,
                'f_name' => 'Ahmed',
                'l_name' => 'elsayed',
                'email' => 'admin@perfect-food.localhost',
                'password' => '$2y$12$lAg5L1fTJe9xOaA1JyLKBOeqdcrH2rTwHRFZVC7/ynlwoj52vc8EK',
                'remember_token' => '3sajpYfjYJkRzafMmjhdg6W53kV7P08GLxIUHeGxGPuY46kqqCc62wC2smwR',
                'created_at' => '2024-03-20 23:07:31',
                'updated_at' => '2024-03-27 22:22:51',
                'deleted_at' => null,
            ),
        ));
    }
}
