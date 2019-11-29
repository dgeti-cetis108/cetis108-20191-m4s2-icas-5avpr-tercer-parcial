<?php
class MyConnection extends mysqli {
    private $host = 'localhost';
    private $user = 'admin_michidb';
    private $passwd = '123';
    private $dbname = 'michidb';
    private $port = 3306;
    public  $link;

    public function __construct() {
        $this->link = parent::__construct(
            $this->host,
            $this->user,
            $this->passwd,
            $this->dbname,
            $this->port
        );
    }
}

// $cnn = new MyConnection();
// var_dump($cnn);

/* resultado
c:/users/default/tercer_parcial/src/app/mysqlconection.php:22:
class MyConnection#1 (19) {
  public $affected_rows =>
  int(0)
  public $client_info =>
  string(79) "mysqlnd 5.0.12-dev - 20150407 - $Id: 3591daad22de08524295e1bd073aceeff11e6579 $"
  public $client_version =>
  int(50012)
  public $connect_errno =>
  int(0)
  public $connect_error =>
  NULL
  public $errno =>
  int(0)
  public $error =>
  string(0) ""
  public $error_list =>
  array(0) {
  }
  public $field_count =>
  int(0)
  public $host_info =>
  string(25) "Localhost via UNIX socket"
  public $info =>
  NULL
  public $insert_id =>
  int(0)
  public $server_info =>
  string(6) "5.7.28"
  public $server_version =>
  int(50728)
  public $stat =>
  string(134) "Uptime: 9224  Threads: 1  Questions: 14  Slow queries: 0  Opens: 111  Flush tables: 1  Open tables: 104  Queries per second avg: 0.001"
  public $sqlstate =>
  string(5) "00000"
  public $protocol_version =>
  int(10)
  public $thread_id =>
  int(7)
  public $warning_count =>
  int(0)
}
*/