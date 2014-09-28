unit uFIBCommonDBErrors;

interface

resourcestring
    E_FIBCommonDB_DBIsNil = 'FIBDatabase is nil!';
    E_FIBCommonDB_AlreadyStarted = 'TFIBDBTransaction.Start: already started!';
    E_FIBCommonDB_CommitNotInTran = 'TFIBDBTransaction.Commit: not in transaction!';
    E_FIBCommonDB_RollbackNotInTran = 'TFIBDBTransaction.Rollback: not in transaction!';
    E_FIBCommonDB_NewSQLNotpFIBDataSet = 'TFIBDBTransaction.NewSQL: not TpFIBDataSet!';
    E_FIBCommonDB_NewSQLNotMine = 'TFIBDBTransaction.NewSQL: supported dataset is not mine!';


implementation

end.
