<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RoleHasPermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('role_has_permissions')->delete();
        
        \DB::table('role_has_permissions')->insert(array (
            0 => 
            array (
                'permission_id' => 1,
                'role_id' => 3,
            ),
            1 => 
            array (
                'permission_id' => 3,
                'role_id' => 3,
            ),
            2 => 
            array (
                'permission_id' => 5,
                'role_id' => 3,
            ),
            3 => 
            array (
                'permission_id' => 7,
                'role_id' => 3,
            ),
            4 => 
            array (
                'permission_id' => 9,
                'role_id' => 3,
            ),
            5 => 
            array (
                'permission_id' => 11,
                'role_id' => 3,
            ),
            6 => 
            array (
                'permission_id' => 15,
                'role_id' => 3,
            ),
            7 => 
            array (
                'permission_id' => 17,
                'role_id' => 3,
            ),
            8 => 
            array (
                'permission_id' => 37,
                'role_id' => 3,
            ),
            9 => 
            array (
                'permission_id' => 39,
                'role_id' => 3,
            ),
            10 => 
            array (
                'permission_id' => 41,
                'role_id' => 3,
            ),
            11 => 
            array (
                'permission_id' => 43,
                'role_id' => 3,
            ),
            12 => 
            array (
                'permission_id' => 45,
                'role_id' => 3,
            ),
            13 => 
            array (
                'permission_id' => 47,
                'role_id' => 3,
            ),
            14 => 
            array (
                'permission_id' => 51,
                'role_id' => 3,
            ),
            15 => 
            array (
                'permission_id' => 53,
                'role_id' => 3,
            ),
        ));
        
        
    }
}