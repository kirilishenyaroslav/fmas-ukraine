unit uIBXCommonDBErrors;

interface

resourcestring
    E_IBXCommonDB_DBIsNil = 'IBDatabase is nil!';
    E_IBXCommonDB_AlreadyStarted = 'TIBXDBTransaction.Start: already started!';
    E_IBXCommonDB_CommitNotInTran = 'TIBXDBTransaction.Commit: not in transaction!';
    E_IBXCommonDB_RollbackNotInTran = 'TIBXDBTransaction.Rollback: not in transaction!';
    E_IBXCommonDB_NewSQLNotIBQuery = 'TIBXDBTransaction.NewSQL: not TIBQuery!';
    E_IBXCommonDB_NewSQLNotMine = 'TIBXDBTransaction.NewSQL: supported query is not mine!';

implementation

end.
