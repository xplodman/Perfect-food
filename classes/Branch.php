<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Branch {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function getAllBranches() {
		try {
			$query = "SELECT * FROM branches";

			return $this->db->connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			// Handle the exception, such as logging or displaying an error message
			return [];
		}
	}
}
