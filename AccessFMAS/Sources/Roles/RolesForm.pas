unit RolesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, ActnList, IBDatabase, MainDM, Db,
  AddRole, Role, Placemnt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  Variants, frxClass, frxDBSet, frxExportXLS, frxExportImage,
  frxExportHTML, Menus, frxExportPDF, frxExportXML, frxExportRTF, pFIBDataSet,
  FIBDataSet;
  

type
  TFormRoles = class(TForm)
    ToolBarRoles: TToolBar;
    StatusBarRoles: TStatusBar;
    ToolButtonAdd: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDel: TToolButton;
    ActionList: TActionList;
    Add: TAction;
    Edit: TAction;
    Del: TAction;
    DataSourceRoles: TDataSource;
    ToolButtonSel: TToolButton;
    Sel: TAction;
    ToolButtonExit: TToolButton;
    Exit: TAction;
    FormStorage1: TFormStorage;
    DBGridRoles: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DBGridRolesDBColumn1: TcxGridDBColumn;
    DBGridRolesDBColumn2: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DBGridRolesDBColumn3: TcxGridDBColumn;
    frxDBDataset1: TfrxDBDataset;
    GroupPrint: TToolButton;
    Print: TAction;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxReport1: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    DSetRoles: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure DBGridRolesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DelExecute(Sender: TObject);
    procedure DBGridRolesDblClick(Sender: TObject);
    procedure GroupPrintClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String; var Value: Variant);
    procedure PrintExecute(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
    FResultSQL: string;
  public
    { Public declarations }
    ResultQuery: TpFIBDataSet;
    constructor Create(Owner: TComponent; Mode: Integer;Id_object:Integer;Id_Action:Integer);reintroduce;
  end;

implementation

{$R *.DFM}

constructor TFormRoles.Create(Owner: TComponent; Mode: Integer;Id_object:Integer;Id_Action:Integer);
begin
     inherited Create(Owner);
     FMode := Mode;
     DSetRoles.SelectSQL.Text:='SELECT * FROM ROLES_SELECT_FOR_OBJECT('+IntToStr(Id_object)+','+IntToStr(Id_Action)+')';
     FResultSQL := 'select * from roles where ';
     ResultQuery := nil;
     if FMode = fmWork then Self.FormStyle := fsMDIChild;

     DSetRoles.CloseOpen(True);
end;

procedure TFormRoles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormRoles.AddExecute(Sender: TObject);
var
   FormAddRole: TFormAddRole;
begin
    FormAddRole := TFormAddRole.Create(Self, nil, fmAdd);
    FormAddRole.ShowModal;
    if Assigned(FormAddRole.FResultRole) then
    begin
        Screen.Cursor := crHourGlass;
        DSetRoles.CloseOpen(True);
        DSetRoles.Locate('ID_ROLE', FormAddRole.FResultRole.RoleID,[]);
        Screen.Cursor := crDefault;
    end;
    FormAddRole.Free;
end;

procedure TFormRoles.EditExecute(Sender: TObject);
var
   FormAddRole: TFormAddRole;
   theRole: TRole;
begin
     theRole := TRole.Create(Self, DMMain.KruAccessDB);
     theRole.FillDataBy(DSetRoles.FieldByName('ID_ROLE').AsInteger);
     FormAddRole := TFormAddRole.Create(Self, theRole, fmEdit);
     FormAddRole.ShowModal;
     if Assigned(FormAddRole.FResultRole) then
     begin
          Screen.Cursor := crHourGlass;
          DSetRoles.CloseOpen(True);
          DSetRoles.Locate('ID_ROLE', FormAddRole.FResultRole.RoleID,[]);
          Screen.Cursor := crDefault;
     end else theRole.Free;
     FormAddRole.Free;
end;

procedure TFormRoles.FormCreate(Sender: TObject);
begin
     if FMode = fmMultiSelect then
     begin
          DBGridRoles.OptionsSelection.MultiSelect:=true;
     end;
end;

procedure TFormRoles.SelExecute(Sender: TObject);
var
   i: Integer;
begin
     case FMode of
          fmMultiSelect:
          begin
               Self.Hide;
               for i := 0 to DBGridRoles.Controller.SelectedRecordCount-1 do
               begin
                    FResultSQL := FResultSQL + ' id_role = '+
                               VarToStr(DBGridRoles.Controller.SelectedRecords[i].Values[2])+' or';
               end;
               if DBGridRoles.Controller.SelectedRecordCount >= 1
               then begin
                          Delete(FResultSQL,Length(FResultSQL)-1,2);
                          ResultQuery:=TpFIBDataSet.Create(self);
                          ResultQuery.Database:=DMMain.WorkDatabase;
               end
               else ResultQuery := nil;
          end;
          fmSelect:
          begin
               FResultSQL := FResultSQL + ' id_role = '+
                               IntToStr(DSetRoles.FieldByName('id_role').AsInteger);
          end;
     end;
     if ((FMode = fmMultiSelect) or (FMode = fmSelect)) and Assigned(ResultQuery) then
     begin
          ResultQuery.SelectSQL.Text := FResultSQL;
          try
             ResultQuery.Open;
          except
                on exc: Exception do
                begin
                     ShowErrorMessage('Не вдалось виконати запит! '+
                                          exc.Message);
                end;
          end;
     end;
     Close;
end;

procedure TFormRoles.ExitExecute(Sender: TObject);
begin
     Close;
end;

procedure TFormRoles.DBGridRolesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (FMode <> fmWork) and (Key = VK_ESCAPE) then
     begin
          Close
     end;
end;

procedure TFormRoles.DelExecute(Sender: TObject);
var
  DSet: TpFIBDataSet;
begin
    if not DSetRoles.IsEmpty then
        if MessageDlg('Вилучити вибрану групу?',mtConfirmation,[mbYes, mbNo], 0) <> ID_NO then
        begin
            DSet:=TpfibDataset.Create(Self);
            DSet.Database:=DMMain.WorkDatabase;
            DSet.Transaction.StartTransaction;
            DSet.SelectSQL.Text := 'EXECUTE PROCEDURE ACCESS_ROLES_DELETE('+DSetRoles.fieldbyname('ID_ROLE').AsString + ')';
            DSet.Open;
            DSet.Transaction.Commit;
            DSetRoles.CloseOpen(True);
        end;
end;

procedure TFormRoles.DBGridRolesDblClick(Sender: TObject);
begin
     if (FMode <> fmWork)
     then begin
               SelExecute(self);
     end;
end;

procedure TFormRoles.GroupPrintClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    frxReport1.Clear;
    if frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\PrintOperations.fr3',true) then
    begin
        cxGrid1.BeginUpdate;
        if frxReport1.PrepareReport(true) then frxReport1.ShowPreparedReport;
        cxGrid1.EndUpdate;
        DSetRoles.First;
    end
    else ShowErrorMessage('Файл звіту "\Reports\PrintOperations.fr3" не знайдено!');
    Screen.Cursor := crDefault;
end;

procedure TFormRoles.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if varname='FIELD_1'      then value:='Назва';
    if varname='FIELD_2'      then value:='Повна назва';
    if varname='REPORT_TITLE' then value:='Групи';
end;

procedure TFormRoles.PrintExecute(Sender: TObject);
begin
    GroupPrintClick(sender);
end;


end.
