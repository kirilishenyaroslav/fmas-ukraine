unit UsersForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, ActnList, IBDatabase, MainDM, Db,
  Adduser, User, cxStyles, cxCustomData, IBStoredproc,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, StdCtrls, Placemnt, frxClass, frxDBSet, frxExportHTML,
  frxExportImage, frxExportXLS, Menus, Variants,
  frxExportXML, frxExportPDF, FR_Class, frXMLExl, frxRich, frxExportRTF, accmgmt,
  pFIBDataSet, FIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, DBCtrls;

type
  TFormUsers = class(TForm)
    ToolBarUsers: TToolBar;
    ToolButtonAdd: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDel: TToolButton;
    ActionList: TActionList;
    Add: TAction;
    Edit: TAction;
    Del: TAction;
    DataSourceUsers: TDataSource;
    ToolButtonSel: TToolButton;
    Sel: TAction;
    ToolButtonExit: TToolButton;
    Exit: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    SearchPanel: TPanel;
    SearchEdit: TEdit;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SearchNextButton: TButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    FormStorage1: TFormStorage;
    PrintUsers: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    Print: TAction;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxXMLExport1: TfrxXMLExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxReport1: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DSetUsers: TpFIBDataSet;
    pFIBStoredProc1: TpFIBStoredProc;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure DBGridUsersKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DelExecute(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchNextButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure PrintUsersClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String; var Value: Variant);
    procedure PrintExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FMode: Integer;
    FResultSQL: string;
  public
    ResultQuery: TpFIBDataSet;
    constructor Create(Owner: TComponent; Mode: Integer);
  end;

implementation

{$R *.DFM}

constructor TFormUsers.Create(Owner: TComponent; Mode: Integer);
begin
    inherited Create(Owner);
    FMode := Mode;
    FResultSQL := 'select * from ACCESS_USER_SELECT';
    ResultQuery := nil;
    if FMode = fmWork then Self.FormStyle := fsMDIChild;
    DSetUsers.SelectSQL.Text:='select * from ACCESS_USER_SELECT order by name asc';
end;

procedure TFormUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFormUsers.AddExecute(Sender: TObject);
var
  FormAddUser: TFormAddUser;
begin
    FormAddUser := TFormAddUser.Create(Self, nil, fmAdd);

    if FormAddUser.ShowModal = mrOk then
    begin
        DSetUsers.CloseOpen(True);
        Screen.Cursor := crHourGlass;
        DSetUsers.Locate('ID_USER', FormAddUser.ID_User,[]);
        Screen.Cursor := crDefault;
    end;
    FormAddUser.Free;
end;

procedure TFormUsers.EditExecute(Sender: TObject);
var
   FormAddUser: TFormAddUser;
   theUser: TUser;
begin
    theUser := TUser.Create(Self, DMMain.KruAccessDB);
    theUser.FillDataBy(DSetUsers.FieldByName('ID_USER').AsInteger);
    FormAddUser := TFormAddUser.Create(Self, theUser, fmEdit);
    FormAddUser.id_user := theUser.UserId;
    FormAddUser.id_pcard := theUser.UserIDExt;

    if FormAddUser.ShowModal = mrOk then
    begin
        DSetUsers.CloseOpen(True);
        Screen.Cursor := crHourGlass;
        DSetUsers.Locate('ID_USER', FormAddUser.ID_User,[]);
        Screen.Cursor := crDefault;
    end else theUser.Free;

    FormAddUser.Free;
end;

procedure TFormUsers.FormCreate(Sender: TObject);
begin
    if FMode = fmMultiSelect then cxGrid1DBTableView1.OptionsSelection.MultiSelect:=True;
    DSetUsers.CloseOpen(True);
end;

procedure TFormUsers.SelExecute(Sender: TObject);
var
  i: Integer;
  id : Integer;
begin
    case FMode of
        fmMultiSelect:
        begin
            Self.Hide;
            FResultSQL := FResultSQL+' where';
            for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
            begin
                id := cxGrid1DBTableView1.DataController.GetRecordId(cxGrid1DBTableView1.Controller.SelectedRecords[i].RecordIndex);
                DSetUsers.Locate('ID_USER', id, []);
                FResultSQL := FResultSQL+' id_user='+IntToStr(DSetUsers.FieldByName('Id_User').AsInteger)+' or';
            end;

            if cxGrid1DBTableView1.DataController.GetSelectedCount >= 1 then
                Delete(FResultSQL, Length(FResultSQL)-1, 2)
            else
                ResultQuery := nil;
        end;

        fmSelect:
        begin
             FResultSQL := FResultSQL+' where id_user='+IntToStr(DSetUsers.FieldByName('id_user').AsInteger);
        end;
    end;
    if ((FMode = fmMultiSelect) or (FMode = fmSelect)) and Assigned(ResultQuery) then
    begin
        ResultQuery.SelectSQL.Text := FResultSQL + ' order by name asc';
        try ResultQuery.Open;
        except
            on exc: Exception do ShowErrorMessage('Помилка у запиті! '+ exc.Message);
        end;
    end;
    Close;
end;

procedure TFormUsers.ExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TFormUsers.DBGridUsersKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (FMode <> fmWork) and (Key = VK_ESCAPE) then Close;
end;

procedure TFormUsers.DelExecute(Sender: TObject);
var
  DSet: TpFIBDataSet;
begin
    if not DSetUsers.IsEmpty then
    if MessageDlg('Вилучити вибраного користувача?',mtConfirmation,[mbYes, mbNo], 0) <> ID_NO then
    begin
        DSet:=TpFIBDataSet.Create(nil);
        DSet.Database:=DMMain.WorkDatabase;
        DSet.Transaction.StartTransaction;
        DSet.SelectSQL.Text:='EXECUTE PROCEDURE ACCESS_Users_DELETE(:idu)';
        DSet.ParamByName('idu').AsInteger:=DSetUsers.FieldByName('ID_USER').AsInteger;
        DSet.Open;
        DSet.Transaction.Commit;
        DSet.Free;
        DSetUsers.CloseOpen(True);
    end;
end;

procedure TFormUsers.SearchEditChange(Sender: TObject);
var
  KeyField : String;
begin
    if RadioButton1.Checked then KeyField := 'NAME'
                            else KeyField := 'FULL_NAME';

    DSetUsers.Locate(KeyField, SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFormUsers.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = VK_BACK
    then begin
        SearchEdit.Text := '';
        Key := 0;
    end;
end;

procedure TFormUsers.cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
begin
    if Ord(key) > 31 then SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TFormUsers.SearchNextButtonClick(Sender: TObject);
var
  KeyField : String;
begin
    if RadioButton1.Checked then KeyField := 'NAME'
                            else KeyField := 'FULL_NAME';
        
    DSetUsers.LocateNext(KeyField, SearchEdit.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFormUsers.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    if (FMode <> fmWork) then SelExecute(self);
end;

procedure TFormUsers.PrintUsersClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;    
    if frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\PrintOperations.fr3',true) then
    begin
        cxGrid1.BeginUpdate;
        if frxReport1.PrepareReport(true) then frxReport1.ShowPreparedReport;
        cxGrid1.EndUpdate;
        DSetUsers.First;
    end
    else ShowErrorMessage('Файл звіту "\Reports\PrintOperations.fr3" не знайдено!');
    Screen.Cursor := crDefault;
end;

procedure TFormUsers.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if varname='FIELD_1'      then value:='Ім''я користувача';
    if varname='FIELD_2'      then value:='П.І.Б. користувача';
    if varname='REPORT_TITLE' then value:='Користувачі';
end;

procedure TFormUsers.PrintExecute(Sender: TObject);
begin
    PrintUsersClick(Sender);
end;

procedure TFormUsers.N1Click(Sender: TObject);
var SP:TIBStoredproc;
begin
    if DSetUsers.RecordCount>0 then
    begin
        if MessageBox(Handle,
         'Ви хочете зробити первинну авторизацію як для користувача системи "Зарплата" ?',
         'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES then
        begin
            SP:=TIBStoredproc.Create(self);
            SP.Database:=DMMain.KruAccessDB;
            SP.Transaction:=DMMain.WriteTransaction;
            DMMain.WriteTransaction.StartTransaction;
            SP.StoredProcName:='Z_DO_AUTHENTIFICATION';
            SP.Prepare;
            SP.ParamByName('ID_USER').Value:=DSetUsers.FieldByName('ID_USER').Value;
            SP.ParamByName('old_hash_pwd').Value:=NULL;
            SP.ParamByName('new_hash_pwd').Value:=NULL;
            SP.ParamByName('FLAG').Value:=1;
            SP.ExecProc;
            DMMain.WriteTransaction.Commit;
            SP.Free;
        end;
    end;
end;

end.
