<?php

/**
 * Get users array
 * @param array $config
 * @return array
 */
function getProjects($config)
{
	$link = connectDb($config);
	selectDb($link, $config);

	$sql = "SELECT p.idproject, p.name, p.alias, p.date_ini, p.date_fini, s.status as status, c.company as company, p.description, p.tweet FROM projects p
			INNER JOIN statuses s
			ON s.idstatuses = p.statuses_idstatuses
			INNER JOIN companies c
			ON c.idcompany = p.companies_idcompany ORDER BY idproject;";
	$result = mysqli_query($link, $sql);
	$row = mysqli_fetch_assoc($result);
	return $result;
}

/**
 * Get DBMS link conection
 * @param array $config
 * @return array $link
 */
function connectDb($config)
{
	$link = mysqli_connect($config['host'],
			$config['user'],
			$config['password']
	);
	return $link;
}

/**
 * Select database
 * @param string $link, array $config
 * @return null
 */
function selectDb($link, $config)
{
	mysqli_select_db($link, $config['db'] );
	mysqli_query($link, 'SET NAMES utf8');
	return;
}

function getProject($idproject, $config)
{
	$link = connectDb($config);
	selectDb($link, $config);

	$sql = "SELECT projects.* FROM projects WHERE projects.idproject = ".$idproject;

	$result = mysqli_query($link, $sql);
	while($row = mysqli_fetch_assoc($result))
	{
		$rows[]=$row;
	}
	return $rows[0];
}


function deleteProject($idproject, $config)
{
	$link = connectDb($config);
	selectDb($link, $config);
	$sql = "DELETE FROM projects WHERE idproject = ".$idproject;
	$result = mysqli_query($link, $sql);
	return $result;
}



function updateUser($iduser, $data, $config)
{
	echo "<pre>";
	print_r($data);
	echo "</pre>";

	$link = connect($config);
	selectDb($link, $config);

	$sql = "UPDATE users SET ";
	foreach ($data as $key => $value)
	{
		$sql.=$key . "='".$value."',";
	}
	$sql.= "WHERE iduser =".$iduser;
	echo $sql;

	die;


	$result = mysqli_query($link, $sql);

	return $result;
}

function insertDb($tablename, $data, $config)
{
	$fields = getFields($tablename, $data, $config);

	$sql = "INSERT INTO ".$tablename." SET ";
	foreach ($fields[1] as $key => $value)
	{
		$sql.=$key . "='".$value."',";
	}
	$sql = substr($sql, 0, strlen($sql)-1);

	$link = connectDb($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	return $result;

}

function update($tablename, $data, $config)
{
	$fields = getFields($tablename, $data, $config);
	$sql = "UPDATE ".$tablename." SET ";
	foreach ($fields[1] as $key => $value)
	{
		$sql.=$key . "='".$value."',";
	}
	$sql = substr($sql, 0, strlen($sql)-1);
	$sql.= " WHERE ";
	foreach ($fields[0] as $key => $value)
	{
		$sql.=$value."='".$data[$value]."' AND ";
	}
	$sql = substr($sql, 0, strlen($sql)-4);

	$link = connectDb($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	return $result;
}

function getFields($tablename, $data, $config)
{
	$sql = "DESCRIBE ".$tablename;
	$link = connectDb($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	while($row = mysqli_fetch_assoc($result))
	{
		if($row['Key']!=='PRI')
			$fields[] = $row['Field'];
		else
			$pkey[]=$row['Field'];
	}
	foreach ($data as $key => $value)
	{
		if(!in_array($key, $fields))
			unset($data[$key]);
	}
	return array($pkey, $data);
}



