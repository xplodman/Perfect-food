<?php

namespace FamilyRestaurant\Classes;

use PDO;
use PDOException;

class DB {
	public $connection;
	private $db_host = 'localhost';
	private $db_name = 'family_restaurant';
	private $db_username = 'root';
	private $db_password = 'root';

	public function __construct() {
		try {
			$this->connection = new PDO( "mysql:host={$this->db_host};dbname={$this->db_name}", $this->db_username, $this->db_password );

			// set the PDO error mode to exception
			$this->connection->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = $e->getMessage();
		}
	}
}
