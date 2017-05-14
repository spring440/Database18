USE s17guest18;
GO
BACKUP DATABASE s17guest18
    TO DISK = '\s17guest18.Bak'
      WITH FORMAT,
        MEDIANAME = 'Z_SQLServerBackups',
        NAME = 'Full Backup of s17guest18';
GO