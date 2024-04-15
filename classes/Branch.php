<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Branch {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Retrieves all branches from the database.
	 *
	 * @return array Returns an array containing all branches fetched from the database.
	 */
	public function retrieveAllBranches() {
		try {
			$query = "SELECT * FROM branches";

			return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
		} catch ( PDOException $e ) {
			return [];
		}
	}
}
