unit uSmetaFilter;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, FIBQuery, pFIBQuery, RxMemDS, cxClasses,
    ActnList, FIBDatabase, pFIBDatabase, IBase, FIBDataSet, pFIBDataSet;

type
    TfrmSmetaFilter = class(TFrame)
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
        SpeedButton1: TSpeedButton;
        cxGrid2: TcxGrid;
        GroupFilterView: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        ActionList1: TActionList;
        AddGroup: TAction;
        Refresh: TAction;
        AddSmeta: TAction;
        DeleteAction: TAction;
        DB: TpFIBDatabase;
        RxGroups: TRxMemoryData;
        RxGroupsId_Group: TIntegerField;
        RxGroupsGroup_Kod: TIntegerField;
        RxGroupsGroup_Title: TStringField;
        RxSmets: TRxMemoryData;
        GroupSource: TDataSource;
        GroupFilterViewId_Group: TcxGridDBColumn;
        GroupFilterViewGroup_Kod: TcxGridDBColumn;
        GroupFilterViewGroup_Title: TcxGridDBColumn;
        RxSmetsId_Smeta: TIntegerField;
        RxSmetsSmeta_Kod: TIntegerField;
        RxSmetsSmeta_Title: TStringField;
        SmetaSource: TDataSource;
        SmetaFilterViewId_Smeta: TcxGridDBColumn;
        SmetaFilterViewSmeta_Kod: TcxGridDBColumn;
        SmetaFilterViewSmeta_Title: TcxGridDBColumn;
        Panel2: TPanel;
        AddSmetaButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        SmetsByGroup: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        DeleteGroupAction: TAction;
        AddSmetaInTempTable: TpFIBQuery;
        WriteTransaction: TpFIBTransaction;
    DeleteSmetaInTempTable: TpFIBQuery;
        procedure AddGroupExecute(Sender: TObject);
        procedure AddSmetaExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure DeleteGroupActionExecute(Sender: TObject);
    private
        DB_Id_Session: Variant;

        procedure AddSmet(Id_Smeta: Integer; Smeta_Kod: Integer; Smeta_Title: string);
        procedure DelSmet(Id_Smeta: Integer);
    public
        constructor Create(AOwner: TComponent; Handle: TISC_DB_Handle; DB_Id_Session: Variant); reintroduce;
    end;

implementation

{$R *.dfm}

uses uCommonSp, GlobalSPR, qFTools;

constructor TfrmSmetaFilter.Create(AOwner: TComponent;
    Handle: TISC_DB_Handle; DB_Id_Session: Variant);
begin
    inherited Create(AOwner);
    if DB.Connected then DB.Connected := False;
    DB.Handle := Handle;
    Self.DB_Id_Session := DB_Id_Session;
end;

procedure TfrmSmetaFilter.AddGroupExecute(Sender: TObject);
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
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Period_Beg'] := Date;
            FieldValues['Period_End'] := Date;
            Post;
        end;

                // показать справочник и проанализировать результат
        sp.Show;
        sp.Output.First;
        RxSmets.DisableControls;
        while not sp.Output.Eof do
        begin
            if not RxGroups.Active then RxGroups.Open;

            RxGroups.Append;
            RxGroups['Id_Group'] := sp.Output['Id_Group'];
            RxGroups['Group_Kod'] := sp.Output['Group_Kod'];
            RxGroups['Group_Title'] := sp.Output['Group_Title'];
            RxGroups.Post;
            sp.Output.Next;

                // добавляем сметы под группой
            SmetsByGroup.Close;
            SmetsByGroup.ParamByName('Id_Group').AsInteger := sp.Output['Id_Group'];
            SmetsByGroup.Open;

            SmetsByGroup.First;
            while not SmetsByGroup.Eof do
            begin
                AddSmet(SmetsByGroup['Id_Smeta'], SmetsByGroup['Smeta_Kod'],
                    SmetsByGroup['Smeta_Title']);
                SmetsByGroup.Next;
            end;
        end;
        RxSmets.EnableControls;
        sp.Free;
    end;
end;

procedure TfrmSmetaFilter.AddSmetaExecute(Sender: TObject);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        if not RxSmets.Active then RxSmets.Open;

        AddSmet(id[0], id[3], id[2]);
    end;
end;

procedure TfrmSmetaFilter.DeleteActionExecute(Sender: TObject);
var
    i: Integer;
begin
    if not RxSmets.Active then RxSmets.Open;
    if qFConfirm('Ви справді бажаєте вилучити ці бюджети?') then
        for i := 0 to SmetaFilterView.Controller.SelectedRowCount - 1 do
            DelSmet(SmetaFilterView.Controller.SelectedRows[i].
                Values[SmetaFilterViewID_SMETA.Index]);
end;

procedure TfrmSmetaFilter.AddSmet(Id_Smeta, Smeta_Kod: Integer;
    Smeta_Title: string);
begin
    if not RxSmets.Active then RxSmets.Open;

    RxSmets.Append;
    RxSmets['Id_Smeta'] := Id_Smeta;
    RxSmets['Smeta_Kod'] := Smeta_Kod;
    RxSmets['Smeta_Title'] := Smeta_Title;
    RxSmets.Post;

    if not VarIsNull(DB_Id_Session) then
    begin
        AddSmetaInTempTable.Transaction.StartTransaction;
        AddSmetaInTempTable.ParamByName('Id_Session').AsInt64 := DB_Id_Session;
        AddSmetaInTempTable.ParamByName('Id_Smeta').AsInteger := Id_Smeta;
        AddSmetaInTempTable.ExecQuery;
        AddSmetaInTempTable.Transaction.Commit;
    end;
end;

procedure TfrmSmetaFilter.DeleteGroupActionExecute(Sender: TObject);
var
    i, Id_Group: Integer;
    bookmark: TBookmark;
begin
    bookmark := RxGroups.GetBookmark;
    RxGroups.DisableControls;
    RxSmets.DisableControls;
    if qFConfirm('Ви справді бажаєте вилучити ці групи бюджетів?') then
        for i := 0 to GroupFilterView.Controller.SelectedRowCount - 1 do
        begin
            Id_Group := GroupFilterView.Controller.SelectedRows[i].
                Values[GroupFilterViewID_GROUP.Index];

            RxGroups.First;
            if RxGroups.Locate('Id_Group', Id_Group, []) then
                RxGroups.Delete;

                      // удаляем сметы под группой
            SmetsByGroup.Close;
            SmetsByGroup.ParamByName('Id_Group').AsInteger := Id_Group;
            SmetsByGroup.Open;

            SmetsByGroup.First;
            while not SmetsByGroup.Eof do
            begin
                DelSmet(SmetsByGroup['Id_Smeta']);
                SmetsByGroup.Next;
            end;
        end;
    if not RxGroups.IsEmpty then RxGroups.GotoBookmark(bookmark);
    RxGroups.EnableControls;
    RxSmets.EnableControls;
end;

procedure TfrmSmetaFilter.DelSmet(Id_Smeta: Integer);
var
    bookmark: TBookmark;
begin
    if not RxSmets.Active then RxSmets.Open;

    bookmark := RxSmets.GetBookmark;

    RxSmets.First;
    if RxSmets.Locate('Id_Smeta', Id_Smeta, []) then
    begin
        RxSmets.Delete;

        if not VarIsNull(DB_Id_Session) then
        begin
            DeleteSmetaInTempTable.Transaction.StartTransaction;
            DeleteSmetaInTempTable.ParamByName('Id_Session').AsInt64 := DB_Id_Session;
            DeleteSmetaInTempTable.ParamByName('Id_Smeta').AsInteger := Id_Smeta;
            DeleteSmetaInTempTable.ExecQuery;
            DeleteSmetaInTempTable.Transaction.Commit;
        end;
    end;

    if not RxSmets.IsEmpty then RxSmets.GotoBookmark(bookmark);
end;

end.

