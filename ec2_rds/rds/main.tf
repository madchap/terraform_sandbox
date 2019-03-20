module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "defectdojo-poc"

  # http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine            = "mariadb"
  engine_version    = "10.3.8"
  instance_class    = "db.t3.medium"
  allocated_storage = 20
  storage_encrypted = false

  name     = "defectdojopoc"
  username = "dojo"
  password = "${data.aws_kms_secrets.db.plaintext["dojo-password"]}"
  port     = "3306"

  vpc_security_group_ids = ["${data.aws_security_group.allow_3306_in.id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  multi_az = false

  # disable backups to create DB faster
  backup_retention_period = 0

   tags = "${merge(var.default_tags, map(
    "DB", "Defect Dojo POC"
  ))}"

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  # create_db_subnet_group = true
  # db_subnet_group_name = "mysql-dojo-subnetgroup"
  # DB subnet group
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

  # DB parameter group
  family = "mariadb10.3"

  # DB option group
  major_engine_version = "10.3"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "defectdojo-poc"

  # Database Deletion Protection
  deletion_protection = false

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
