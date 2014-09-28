unit uTableSignersData;

interface

uses
    SysUtils, Classes, ActnList, ImgList, Controls, uCommonDB, DB,
    FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery, uActionControl;

type
    TdmTableSigners = class(TDataModule)
        SignersSource: TDataSource;
        DB: TpFIBDatabase;
        SelectTableSigners: TpFIBDataSet;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        RealSignersSelect: TpFIBDataSet;
        RealSignersSource: TDataSource;
    private
    public
        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    dmTableSigners: TdmTableSigners;

implementation

uses uTableStrings, uFIBCommonDB, IBase, uSysParams,
    uFormControl, Dialogs;

{$R *.dfm}

constructor TdmTableSigners.Create(AOwner: TComponent; Handle: Integer);
begin
    inherited Create(AOwner);
    DB.DBParams.Add('user_name=' + DBLogin);
    DB.DBParams.Add('password=' + DBLogin);
    DB.Handle := TISC_DB_Handle(Handle);
end;



end.
