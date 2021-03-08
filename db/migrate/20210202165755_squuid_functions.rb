class SquuidFunctions < ActiveRecord::Migration[6.1]
  def change
    def up
      down

      current_user = execute('SELECT CURRENT_USER()').first.first
      name, host   = current_user.split('@')

      execute <<-SQL
      CREATE DEFINER=`#{name}`@`#{host}` FUNCTION `squuid`()
      RETURNS binary(16) DETERMINISTIC
      BEGIN
        DECLARE huuid varchar(36);
        SELECT uuid() into huuid;
        RETURN UNHEX(CONCAT(SUBSTR(huuid, 15, 4),SUBSTR(huuid, 10, 4),SUBSTR(huuid, 1, 8),SUBSTR(huuid, 20, 4),SUBSTR(huuid, 25)));
      END
      SQL

      execute <<-SQL
      CREATE DEFINER=`#{name}`@`#{host}` FUNCTION `uuidbin`(val varchar(36))
      RETURNS binary(16) DETERMINISTIC
      RETURN UNHEX(REPLACE(val, '-', ''));
      SQL

      execute <<-SQL
      CREATE DEFINER=`#{name}`@`#{host}` FUNCTION `uuidstr`(val binary(16))
      RETURNS varchar(36) DETERMINISTIC
      BEGIN
        DECLARE huuid varchar(32);
        SELECT LOWER(HEX(val)) into huuid;
        RETURN CONCAT(SUBSTR(huuid, 1, 8),'-',SUBSTR(huuid, 9, 4),'-',SUBSTR(huuid, 13, 4),'-',SUBSTR(huuid, 17, 4),'-',SUBSTR(huuid, 21));
      END
      SQL
    end

    def down
      execute 'DROP FUNCTION IF EXISTS squuid'
      execute 'DROP FUNCTION IF EXISTS uuidbin'
      execute 'DROP FUNCTION IF EXISTS uuidstr'
    end
  end
end
