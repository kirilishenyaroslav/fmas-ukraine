unit dmPCardsView;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, IBCustomDataSet,
    IBQuery, FIBDataSet, pFIBDataSet, Controls, AccMgmt, Messages, Dialogs,
    uCommonSp, ibase, FIBQuery, pFIBQuery;

type
    TLocalModule = class(TDataModule)
        LocalDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        PCardSource: TDataSource;
        ResultQuery: TpFIBDataSet;
        WorkQuery: TpFIBDataSet;
        ResultQueryID_PCARD: TFIBIntegerField;
        ResultQueryTN: TFIBIntegerField;
        ResultQueryFAMILIA: TFIBStringField;
        ResultQueryIMYA: TFIBStringField;
        ResultQueryOTCHESTVO: TFIBStringField;
        ResultQueryID_MAN: TFIBIntegerField;
        ResultQueryFIO: TStringField;
        ParamsQuery: TpFIBDataSet;
        ParamsQueryNAME_FULL: TFIBStringField;
        ResultQueryTIN: TFIBStringField;
        ResultQueryBDATE: TFIBDateField;
        ParamsQueryLOCAL_DEPARTMENT: TFIBIntegerField;
        ResultQueryISWORKING: TFIBIntegerField;
        pFIBQ_Delete: TpFIBQuery;
        ResultQueryTYPE_POST: TFIBStringField;
        ResultQuerySTEP: TFIBStringField;
        ResultQueryZVAN: TFIBStringField;
        ConstsQuery: TpFIBDataSet;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        DefaultLevel: TpFIBDataSet;
        function CheckAccess(Path: string; Action: string;
            DisplayMessage: Boolean = False): Integer;
        procedure ResultQueryCalcFields(DataSet: TDataSet);
    private
    { Private declarations }
    public
        IdServer: Integer;
        ActualDate, SecondDate: TDate;
        ShowWorking, CanRemoveFilter, Select, AdminMode, NewVersion: Boolean;
        Show_Dropped_Workers: Integer;
        LocalIdDepartment: Integer;
        LocalNameDepartment: string;
    end;

type
    TPCardsViewSprav = class(TSprav)
    private
        DM: TLocalModule;

        procedure CreateDM;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
        procedure GetInfo; override;
        function Exists: boolean; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

procedure ShowInfo(DataSet: TDataSet);

var
    LocalModule: TLocalModule;

implementation

uses fmPCardsView, Forms, Variants, uPCardFilter;

{$R *.dfm}

function TLocalModule.CheckAccess(Path: string; Action: string;
    DisplayMessage: Boolean = False): Integer;
var
    i: Integer;
begin
    i := 0;

    if (not AdminMode) then
    begin
        i := fibCheckPermission(Path, Action);
        if i <> 0 then begin
            if DisplayMessage then
                MessageDlg(AcMgmtErrMsg(i), mtError, [mbOk], 0);
        end;
    end;

    CheckAccess := i;
end;


procedure TLocalModule.ResultQueryCalcFields(DataSet: TDataSet);
begin
    ResultQueryFIO.Value := ResultQueryFamilia.Value + ' ' +
        ResultQueryImya.Value + ' ' + ResultQueryOtchestvo.Value;
end;

function CreateSprav: TSprav;
begin
    Result := TPCardsViewSprav.Create;
end;

procedure TPCardsViewSprav.CreateDM;
var
    hnd: Integer;
begin
    Dm := TLocalModule.Create(nil);

    Dm.ReadTransaction.Active := False;
    Dm.WriteTransaction.Active := False;

    if Dm.LocalDatabase.Connected then Dm.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Dm.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    if VarIsNull(Input['ActualDate']) then Dm.ActualDate := Date
    else Dm.ActualDate := Input['ActualDate'];

    if VarIsNull(Input['NewVersion']) then Dm.NewVersion := False
    else
        if Input['NewVersion'] = 1 then Dm.NewVersion := True
        else Dm.NewVersion := False;

    if VarIsNull(Input['SecondDate']) then Dm.ActualDate := 0
    else Dm.SecondDate := Input['SecondDate'];

    if VarIsNull(Input['ShowWorking']) then Dm.ShowWorking := True
    else Dm.ShowWorking := Input['ShowWorking'];

    if VarIsNull(Input['CanRemoveFilter']) then Dm.CanRemoveFilter := True
    else Dm.CanRemoveFilter := Input['CanRemoveFilter'];

    if VarIsNull(Input['AdminMode']) then Dm.AdminMode := False
    else Dm.AdminMode := Input['AdminMode'];

    if VarIsNull(Input['select']) then Dm.Select := True
    else Dm.Select := (Input['select'] <> 0);

    if VarIsNull(Input['Show_Dropped_Workers']) then DM.Show_Dropped_Workers := 0
    else  DM.Show_Dropped_Workers := 1;

    Dm.ParamsQuery.Close;
    Dm.ParamsQuery.Open;

    if not Dm.ParamsQuery.IsEmpty then begin
        Dm.LocalIdDepartment := Dm.ParamsQueryLOCAL_DEPARTMENT.Value;
        Dm.LocalNameDepartment := Dm.ParamsQueryNAME_FULL.Value;
    end;
end;

constructor TPCardsViewSprav.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('ActualDate', ftDate);
    Input.FieldDefs.Add('SecondDate', ftDate);
    Input.FieldDefs.Add('ShowWorking', ftBoolean);
    Input.FieldDefs.Add('CanRemoveFilter', ftBoolean);
    Input.FieldDefs.Add('AdminMode', ftBoolean);
    Input.FieldDefs.Add('Modify', ftInteger);
    Input.FieldDefs.Add('NewVersion', ftInteger);
    Input.FieldDefs.Add('Show_Dropped_Workers', ftInteger);

    Output.FieldDefs.Add('ID_PCARD', ftInteger);
    Output.FieldDefs.Add('FIO', ftString, 255);
    Output.FieldDefs.Add('FIO_SMALL', ftString, 255);
    Output.FieldDefs.Add('TN', ftInteger);

    Output.Open;
    Input.Open;

    DM := nil;
end;

destructor TPCardsViewSprav.Destroy;
begin
    if DM <> nil then DM.Free;
    inherited Destroy;
end;

procedure TPCardsViewSprav.Show;
var
    PCardsViewForm: TPCardsViewForm;
    FilterString: String;
    Filter, RusFIO: Boolean;
    FilterForm: TfmPCardFilter;
begin
    if DM = nil then CreateDM;

    FilterForm := TfmPCardFilter.Create(Application.MainForm);
    if FilterForm.ShowModal = mrOk then
    begin
        FilterString := FilterForm.FilterString.Value;
        RusFIO := FilterForm.RusFIO.Value;
        if FilterString = '' then
            FilterString := '-2';
        FilterForm.Free;
    end
    else
    begin
        FilterForm.Free;
        Exit;
    end;

    PCardsViewForm := TPCardsViewForm.Create(nil, Self, DM, FilterString, RusFIO);

    if VarIsNull(Input['ShowStyle']) or (Input['ShowStyle'] = 0) then
    begin
        if PCardsViewForm.ShowModal = mrOk then begin
            Output.Append;
            Output['ID_PCARD'] := Integer(Dm.ResultQueryID_PCARD.Value);
            Output['FIO'] := Dm.ResultQueryFIO.Value;
            Output['TN'] := DM.ResultQuery['TN'];
            Output['FIO_SMALL'] := Dm.ResultQueryFAMILIA.Value + ' ' +
                Copy(Dm.ResultQueryIMYA.Value, 1, 1) + '.' +
                Copy(Dm.ResultQueryOTCHESTVO.Value, 1, 1) + '.';
            Output.Post;
        end;
        PCardsViewForm.Free;
    end
    else
    begin
        PCardsViewForm.FormStyle := fsMDIChild;
        PCardsViewForm.WindowState := wsMaximized;
        PCardsViewForm.Show;
    end;
end;

function TPCardsViewSprav.Exists: boolean;
begin
    Result := True;
end;

procedure TPCardsViewSprav.GetInfo;
begin

end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;
end.

