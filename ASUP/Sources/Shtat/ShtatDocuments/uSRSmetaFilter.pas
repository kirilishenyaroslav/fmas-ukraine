unit uSRSmetaFilter;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, Buttons, ExtCtrls, ActnList,
    uShtatDocData;

type
    TfmSrSmetaFilter = class(TForm)
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        cxGrid1: TcxGrid;
    SmetaFilterView: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ActionList1: TActionList;
        AddGroup: TAction;
    SmetaFilterViewID_SMETA: TcxGridDBColumn;
    SmetaFilterViewSMETA_TITLE: TcxGridDBColumn;
        Refresh: TAction;
        AddSmetaButton: TSpeedButton;
        AddSmeta: TAction;
        DeleteAction: TAction;
    cxGrid2: TcxGrid;
    GroupFilterView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GroupFilterViewID_SMETA_GROUP: TcxGridDBColumn;
    GroupFilterViewGROUP_TITLE: TcxGridDBColumn;
    SpeedButton1: TSpeedButton;
        procedure AddGroupExecute(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure RefreshExecute(Sender: TObject);
        procedure AddSmetaExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    private
        DM: TdmShtatDoc;
    public
        constructor Create(AOwner: TComponent; DM: TdmShtatDoc); reintroduce;
    end;

var
    fmSrSmetaFilter: TfmSrSmetaFilter;

implementation

uses uCommonSp, GlobalSPR, qFTools;

{$R *.dfm}

constructor TfmSrSmetaFilter.Create(AOwner: TComponent; DM: TdmShtatDoc);
begin
    inherited Create(AOwner);
    Self.DM := DM;
end;

procedure TfmSrSmetaFilter.AddGroupExecute(Sender: TObject);
var
    sp: TSprav;
begin
       // создать справочник
    sp := GetSprav('UP\UpSmetaGroup');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
            FieldValues['Period_Beg'] := DM.ShtatDocSelect['Date_Beg'];
            FieldValues['Period_End'] := DM.ShtatDocSelect['Date_End'];
            Post;
        end;

                // показать справочник и проанализировать результат
        sp.Show;
        sp.Output.First;
        while not sp.Output.Eof do
        begin
            DM.AddSmetaFilterGroup.Transaction.StartTransaction;
            DM.AddSmetaFilterGroup.ParamByName('Id_SR').AsVariant :=
                DM.ShtatDocSelect['Id_SR'];
            DM.AddSmetaFilterGroup.ParamByName('Id_Group').AsVariant :=
                sp.Output['Id_Group'];
            DM.AddSmetaFilterGroup.ParamByName('Act_Date').AsDate :=
                DM.ShtatDocSelect['Date_Beg'];
            DM.AddSmetaFilterGroup.ExecQuery;
            DM.AddSmetaFilterGroup.Transaction.Commit;
            sp.Output.Next;
        end;
        sp.Free;
        Refresh.Execute;
    end;
end;

procedure TfmSrSmetaFilter.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmSrSmetaFilter.FormCreate(Sender: TObject);
begin
    SmetaFilterView.DataController.DataSource := DM.SmetaFilterSource;
    GroupFilterView.DataController.DataSource := DM.GroupFilterSource;
    Refresh.Execute;
end;

procedure TfmSrSmetaFilter.RefreshExecute(Sender: TObject);
begin
    DM.SmetaFilter.Close;
    DM.SmetaFilter.ParamByName('Id_SR').AsVariant := DM.ShtatDocSelect['Id_SR'];
    DM.SmetaFilter.Open;

    DM.GroupFilter.Close;
    DM.GroupFilter.ParamByName('Id_SR').AsVariant := DM.ShtatDocSelect['Id_SR'];
    DM.GroupFilter.Open;
end;

procedure TfmSrSmetaFilter.AddSmetaExecute(Sender: TObject);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DM.DB.Handle, DM.ShtatDocSelect['Date_Beg'], psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        DM.AddSmeta.Transaction.StartTransaction;
        DM.AddSmeta.ParamByName('Id_SR').AsVariant := DM.ShtatDocSelect['Id_SR'];
        DM.AddSmeta.ParamByName('Id_Smeta').AsVariant := id[0];
        DM.AddSmeta.ExecQuery;
        DM.AddSmeta.Transaction.Commit;
    end;
    Refresh.Execute;
end;

procedure TfmSrSmetaFilter.DeleteActionExecute(Sender: TObject);
var
    i: Integer;
begin
    if qFConfirm('Ви справді бажаєте вилучити ці бюджети?') then
    for i:=0 to SmetaFilterView.Controller.SelectedRowCount-1 do
    begin
        DM.DeleteSmetaFilter.Transaction.StartTransaction;
        DM.DeleteSmetaFilter.ParamByName('Id_SR').AsVariant := DM.ShtatDocSelect['Id_SR'];
        DM.DeleteSmetaFilter.ParamByName('Id_Smeta').AsVariant :=
            SmetaFilterView.Controller.SelectedRows[i].Values[SmetaFilterViewID_SMETA.Index];
        DM.DeleteSmetaFilter.ExecQuery;
        DM.DeleteSmetaFilter.Transaction.Commit;
    end;
    Refresh.Execute;
end;

procedure TfmSrSmetaFilter.SpeedButton1Click(Sender: TObject);
var
    i: Integer;
begin
    if qFConfirm('Ви справді бажаєте вилучити ці групи бюджетів?') then
    for i:=0 to GroupFilterView.Controller.SelectedRowCount-1 do
    begin
        DM.DelSmetaGroup.Transaction.StartTransaction;
        DM.DelSmetaGroup.ParamByName('Id_SR').AsVariant := DM.ShtatDocSelect['Id_SR'];
        DM.DelSmetaGroup.ParamByName('ID_GROUP').AsVariant :=
            GroupFilterView.Controller.SelectedRows[i].
            Values[GroupFilterViewID_SMETA_GROUP.Index];
        DM.DelSmetaGroup.ExecQuery;
        DM.DelSmetaGroup.Transaction.Commit;
    end;
    Refresh.Execute;
end;
end.

