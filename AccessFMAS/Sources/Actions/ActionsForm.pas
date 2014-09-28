unit ActionsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, ActnList, IBDatabase, MainDM, Db,
  IBCustomDataSet, IBQuery, AddAction, Action, Lock, Placemnt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  frxClass, frxDBSet, Menus, frxExportImage, frxExportXLS, frxExportHTML, frxExportPDF,
  frxExportXML, frxExportRTF, FIBDataSet, pFIBDataSet;

type
  TFormActions = class(TForm)
    ToolBarActions: TToolBar;
    StatusBarActions: TStatusBar;
    ToolButtonAdd: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDel: TToolButton;
    ActionList: TActionList;
    Add: TAction;
    Edit: TAction;
    Del: TAction;
    DataSourceActions: TDataSource;
    ToolButtonSel: TToolButton;
    Sel: TAction;
    ToolButtonExit: TToolButton;
    Exit: TAction;
    FormStorage1: TFormStorage;
    cxGrid1: TcxGrid;
    DBGridActions: TcxGridDBTableView;
    DBGridActionsDBColumn1: TcxGridDBColumn;
    DBGridActionsDBColumn2: TcxGridDBColumn;
    DBGridActionsDBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ToolButtonPrint: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    Print: TAction;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxReport1: TfrxReport;
    DSetActions: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure DBGridActionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DelExecute(Sender: TObject);
    procedure DBGridActionsDblClick(Sender: TObject);
    procedure ToolButtonPrintClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure PrintExecute(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
    FResultSQL: string;
  public
    { Public declarations }
    ResultQuery: TIBQuery;
    constructor Create(Owner: TComponent; Mode: Integer;Id_object:Integer);reintroduce;
  end;

implementation

{$R *.DFM}

constructor TFormActions.Create(Owner: TComponent; Mode: Integer;Id_object:Integer);
begin
     inherited Create(Owner);
     DSetActions.SelectSQL.Text :='SELECT * FROM ACTIONS_SELECT_TO_OBJ('+IntToStr(Id_object)+')';
     FMode := Mode;
     FResultSQL := 'select * from actions where ';
     ResultQuery := nil;
     if FMode = fmWork then Self.FormStyle := fsMDIChild;
     DSetActions.SelectSQL.Text:='select a.* from ACTIONS a';
end;

procedure TFormActions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormActions.AddExecute(Sender: TObject);
var
   FormAddAction: TFormAddAction;
begin
     FormAddAction := TFormAddAction.Create(Self, nil, fmAdd);
     FormAddAction.ShowModal;
     if Assigned(FormAddAction.FResultObjectAction) then
     begin
          DSetActions.CloseOpen(True);
          Screen.Cursor := crHourGlass;
          DSetActions.Locate('ID_ACTION', FormAddAction.FResultObjectAction.ActionID,[]);
          Screen.Cursor := crDefault;
     end;
     FormAddAction.Free;
end;

procedure TFormActions.EditExecute(Sender: TObject);
var
   FormAddAction: TFormAddAction;
   objAct: TObjectAction;
begin
     objAct := TObjectAction.Create(Self, DMMain.KruAccessDB);
     objAct.FillDataBy(DSetActions.FieldByName('ID_ACTION').AsInteger);
     FormAddAction := TFormAddAction.Create(Self, objAct, fmEdit);
     FormAddAction.ShowModal;
     if Assigned(FormAddAction.FResultObjectAction) then
     begin
          DSetActions.CloseOpen(True);
          Screen.Cursor := crHourGlass;
          DSetActions.Locate('ID_ACTION', FormAddAction.FResultObjectAction.ActionID,[]);
          Screen.Cursor := crDefault;
     end else objAct.Free;
     FormAddAction.Free;
end;

procedure TFormActions.FormCreate(Sender: TObject);
begin
     if FMode = fmMultiSelect then DBGridActions.OptionsSelection.MultiSelect:=true;

     ToolButtonAdd.Enabled  := true;
     ToolButtonEdit.Enabled := true;
     ToolButtonDel.Enabled  := true;

     DSetActions.CloseOpen(True);
end;

procedure TFormActions.SelExecute(Sender: TObject);
var
   i: Integer;
begin
     case FMode of
          fmMultiSelect:
          begin
               Self.Hide;
               for i := 0 to DBGridActions.Controller.SelectedRecordCount-1 do
               begin
                    FResultSQL := FResultSQL + ' id_action = '+
                               IntToStr(DBGridActions.Controller.SelectedRecords[i].Values[2])+' or';
               end;
               if DBGridActions.Controller.SelectedRecordCount >= 1
               then begin
                           Delete(FResultSQL,Length(FResultSQL)-1,2);
                           ResultQuery:=TIBQuery.Create(self);
                           ResultQuery.Database:=DMMain.KruAccessDB;
                           ResultQuery.Transaction:=DMMain.ReadTransaction;
               end
               else ResultQuery := nil;
          end;
          fmSelect:
          begin
               FResultSQL := FResultSQL + ' id_action = '+
                               IntToStr(DSetActions.FieldByName('id_action').AsInteger);
          end;
     end;
     if ((FMode = fmMultiSelect) or (FMode = fmSelect)) and Assigned(ResultQuery) then
     begin
          ResultQuery.SQL.Text := FResultSQL;
          try
             ResultQuery.Open;
          except
                on exc: Exception do
                begin
                     ShowErrorMessage('Не вдалося виконати запит! '+
                                          exc.Message);
                end;
          end;
     end;
     Close;
end;

procedure TFormActions.ExitExecute(Sender: TObject);
begin
     Close;
end;

procedure TFormActions.DBGridActionsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (FMode <> fmWork) and (Key = VK_ESCAPE) then Close;
end;

procedure TFormActions.DelExecute(Sender: TObject);
var
  DSet: TpFIBDataSet;
begin
    if not DSetActions.IsEmpty then
        if MessageDlg('Вилучити вибрану дію?',mtConfirmation,[mbYes, mbNo], 0) <> ID_NO then begin
            DSet:=TpFIBDataSet.Create(nil);
            DSet.Database:=DMMain.WorkDatabase;
            DSet.Transaction.StartTransaction;
            DSet.SelectSQL.Text := 'EXECUTE PROCEDURE ACCESS_ACTIONS_DELETE(:ida)';
            DSet.ParamByName('ida').AsInteger := DSetActions.FieldByName('ID_ACTION').AsInteger;
            DSet.Open;
            DSet.Transaction.Commit;
            DSetActions.CloseOpen(True);
        end;
end;

procedure TFormActions.DBGridActionsDblClick(Sender: TObject);
begin
     if (FMode <> fmWork) then SelExecute(self);
end;

procedure TFormActions.ToolButtonPrintClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    if frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\PrintOperations.fr3',true) then
    begin
        cxGrid1.BeginUpdate;
        if frxReport1.PrepareReport(true) then frxReport1.ShowPreparedReport;
        cxGrid1.EndUpdate;
        DSetActions.First;
    end
    else ShowErrorMessage('Файл звіту "\Reports\PrintOperations.fr3" не знайдено!');
    Screen.Cursor := crDefault;
end;

procedure TFormActions.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if varname='FIELD_1'      then value:='Назва';
    if varname='FIELD_2'      then value:='Повна назва';
    if varname='REPORT_TITLE' then value:='Дії';
end;

procedure TFormActions.PrintExecute(Sender: TObject);
begin
    ToolButtonPrintClick(sender);
end;


end.
