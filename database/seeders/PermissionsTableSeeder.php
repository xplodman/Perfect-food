<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permissions')->delete();
        
        \DB::table('permissions')->insert(array (
            0 =>
            array (
                'id' => 1,
                'name' => 'view-any JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            1 =>
            array (
                'id' => 2,
                'name' => 'view-any JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            2 =>
            array (
                'id' => 3,
                'name' => 'view JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            3 =>
            array (
                'id' => 4,
                'name' => 'view JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            4 =>
            array (
                'id' => 5,
                'name' => 'create JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            5 =>
            array (
                'id' => 6,
                'name' => 'create JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            6 =>
            array (
                'id' => 7,
                'name' => 'update JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            7 =>
            array (
                'id' => 8,
                'name' => 'update JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            8 =>
            array (
                'id' => 9,
                'name' => 'delete JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            9 =>
            array (
                'id' => 10,
                'name' => 'delete JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            10 =>
            array (
                'id' => 11,
                'name' => 'restore JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            11 =>
            array (
                'id' => 12,
                'name' => 'restore JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            12 =>
            array (
                'id' => 13,
                'name' => 'force-delete JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            13 =>
            array (
                'id' => 14,
                'name' => 'force-delete JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            14 =>
            array (
                'id' => 15,
                'name' => 'replicate JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            15 =>
            array (
                'id' => 16,
                'name' => 'replicate JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            16 =>
            array (
                'id' => 17,
                'name' => 'reorder JourneyAttempt',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            17 =>
            array (
                'id' => 18,
                'name' => 'reorder JourneyAttempt',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            18 =>
            array (
                'id' => 19,
                'name' => 'view-any User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            19 =>
            array (
                'id' => 20,
                'name' => 'view-any User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            20 =>
            array (
                'id' => 21,
                'name' => 'view User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            21 =>
            array (
                'id' => 22,
                'name' => 'view User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            22 =>
            array (
                'id' => 23,
                'name' => 'create User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            23 =>
            array (
                'id' => 24,
                'name' => 'create User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            24 =>
            array (
                'id' => 25,
                'name' => 'update User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            25 =>
            array (
                'id' => 26,
                'name' => 'update User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            26 =>
            array (
                'id' => 27,
                'name' => 'delete User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            27 =>
            array (
                'id' => 28,
                'name' => 'delete User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            28 =>
            array (
                'id' => 29,
                'name' => 'restore User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            29 =>
            array (
                'id' => 30,
                'name' => 'restore User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            30 =>
            array (
                'id' => 31,
                'name' => 'force-delete User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            31 =>
            array (
                'id' => 32,
                'name' => 'force-delete User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            32 =>
            array (
                'id' => 33,
                'name' => 'replicate User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            33 =>
            array (
                'id' => 34,
                'name' => 'replicate User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            34 =>
            array (
                'id' => 35,
                'name' => 'reorder User',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            35 =>
            array (
                'id' => 36,
                'name' => 'reorder User',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            36 =>
            array (
                'id' => 37,
                'name' => 'view-any Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            37 =>
            array (
                'id' => 38,
                'name' => 'view-any Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            38 =>
            array (
                'id' => 39,
                'name' => 'view Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            39 =>
            array (
                'id' => 40,
                'name' => 'view Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            40 =>
            array (
                'id' => 41,
                'name' => 'create Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            41 =>
            array (
                'id' => 42,
                'name' => 'create Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            42 =>
            array (
                'id' => 43,
                'name' => 'update Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            43 =>
            array (
                'id' => 44,
                'name' => 'update Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            44 =>
            array (
                'id' => 45,
                'name' => 'delete Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            45 =>
            array (
                'id' => 46,
                'name' => 'delete Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            46 =>
            array (
                'id' => 47,
                'name' => 'restore Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            47 =>
            array (
                'id' => 48,
                'name' => 'restore Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            48 =>
            array (
                'id' => 49,
                'name' => 'force-delete Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            49 =>
            array (
                'id' => 50,
                'name' => 'force-delete Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            50 =>
            array (
                'id' => 51,
                'name' => 'replicate Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            51 =>
            array (
                'id' => 52,
                'name' => 'replicate Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            52 =>
            array (
                'id' => 53,
                'name' => 'reorder Waypoint',
                'guard_name' => 'web',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
            53 =>
            array (
                'id' => 54,
                'name' => 'reorder Waypoint',
                'guard_name' => 'api',
                'created_at' => '2024-03-10 08:13:52',
                'updated_at' => '2024-03-10 08:13:52',
            ),
        ));
    }
}
