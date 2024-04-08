<?php

namespace PerfectFood\Classes;

use PDO;

class Menu
{
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function getMenus()
	{
		$query = "SELECT * FROM menus";

		return $this->db->connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
	}
}