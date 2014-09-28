unit ListPropMan_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  ImgList, dxBar, dxBarExtItems, FIBDatabase, pFIBDatabase, ActnList,
  FIBDataSet, pFIBDataSet, StdCtrls, cxButtons, cxContainer, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Ibase, St_Proc,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxCalendar, St_Loader_Unit;

type
  Tfrm_List_of_Propusk_Man = class(TForm)
    List_Grid: TcxGrid;
    List_Table: TcxGridDBTableView;
    fio: TcxGridDBColumn;
    Dolgnost: TcxGridDBColumn;
    Nomer_propuska: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxStatusBar2: TdxStatusBar;
    Filter_BarEdit: TcxTextEdit;
    Filter_Button: TcxButton;
    CancelFiltr_Button: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ExitAction: TAction;
    SearchAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    prp_CancelAll_LargeButton: TdxBarLargeButton;
    Add_Button: TdxBarLargeButton;
    Edit_Button: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    LargeImages: TImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    WriteProc: TpFIBStoredProc;
    Edit_Action: TAction;
    procedure FormShow(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure prp_CancelAll_LargeButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure Add_ButtonClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure List_TableDblClick(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure Edit_ButtonClick(Sender: TObject);
    procedure Filter_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  frm_List_of_Propusk_Man: Tfrm_List_of_Propusk_Man;

function View_List(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_List;

   var  res:Variant;
        MessagePass: string;
        Add_Caption, Edit_Caption, Del_Caption: string;

implementation

uses Add_Edit_Unit;

{$R *.dfm}

constructor Tfrm_List_of_Propusk_Man.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 Screen.Cursor:= crHourGlass;
 DB.Handle:=DB_Handle;
 Formstyle:=fsMDIChild;
 with  List_Table do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 end;
 MessagePass:='Ця людина вже зареэстрована ?';
 Add_Caption:='Додати';
 Edit_Caption:='Змінити';
 Del_Caption:='Видалити цей запис ?';
 Screen.Cursor:= crDefault;
end;


function View_List(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
var ViewForm: Tfrm_List_of_Propusk_Man;
begin
 if not IsMDIChildFormShow(Tfrm_List_of_Propusk_Man) then
   begin
   ViewForm:=Tfrm_List_of_Propusk_Man.Create(AOwner, DB);
   ViewForm.DataSet.CloseOpen(true);
   View_List:=res;
   end;
end;

procedure Tfrm_List_of_Propusk_Man.FormShow(Sender: TObject);
var FormCaption: string;
begin
FormCaption:='Список осіб, які отримали універсальну перепустку';
caption:=FormCaption;
Filter_BarEdit.BringToFront;
Filter_Button.BringToFront;
CancelFiltr_Button.BringToFront;
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_List_of_Propusk_Man.SearchActionExecute(Sender: TObject);
begin
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_List_of_Propusk_Man.prp_CancelAll_LargeButtonClick(
  Sender: TObject);
begin
close;
end;

procedure Tfrm_List_of_Propusk_Man.FormResize(Sender: TObject);
begin
Filter_BarEdit.BringToFront;
Filter_Button.BringToFront;
CancelFiltr_Button.BringToFront;
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_List_of_Propusk_Man.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action  :=caFree;
end;

procedure Tfrm_List_of_Propusk_Man.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=true;
end;

procedure Tfrm_List_of_Propusk_Man.dxBarLargeButton2Click(Sender: TObject);
begin
DataSet.close;
DataSet.SelectSQL.Clear;
DataSet.SelectSQL.Text:='select * from ST_DT_SOTR_SELECT';
DataSet.CloseOpen(true);
end;

procedure Tfrm_List_of_Propusk_Man.Add_ButtonClick(Sender: TObject);
var res: variant;
edit_item_id: int64;
id_kod_new:int64;
begin
 if MessageBox(Handle,PChar(MessagePass),'?',MB_YESNO or MB_ICONQUESTION)= mrYes then
     begin
  res:=Load_Reestr(SELF,DB.Handle);
  if VarArrayDimCount(res)>0  then begin
     frm_Add_Edit:=Tfrm_Add_Edit.create(self);
     frm_Add_Edit.caption:= Edit_Caption;
         frm_Add_Edit.Familia_Edit.Text:=res[1];
         frm_Add_Edit.Name_Edit.Text:=res[2];
         frm_Add_Edit.Otch_Edit.Text:=res[3];
         edit_item_id:=res[0];

         if frm_Add_Edit.showmodal = mrOk then
          begin
            With WriteProc do
           begin
              StoredProcName := 'ST_DT_SOTR_INSERT';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsVariant := edit_item_id;
              ParamByName('DOLG').AsString:=frm_Add_Edit.Posada_Edit.Text;
              ParamByName('FAMILIA').AsString:=frm_Add_Edit.Familia_Edit.Text;
              ParamByName('IMYA').AsString:=frm_Add_Edit.Name_Edit.Text;
              ParamByName('OTCHESTVO').AsString:=frm_Add_Edit.Otch_Edit.Text;
              ParamByName('PSEVDONIM').AsString:='-';
              ParamByName('FROM_REG').AsInteger:= 1;
              ExecProc;
              id_kod_new :=ParamByName('ID_KOD_NEW').AsInt64;
              try
              Transaction.Commit;
              Close;
              except
              SHOWmessage('Виникла помилка при виконанні процедури ST_DT_SOTR_INSERT');
              Transaction.Rollback;
              close;
              end;
           end;
          end;
  end;
     end
 else
     begin
       frm_Add_Edit:=Tfrm_Add_Edit.create(self);
       frm_Add_Edit.caption:= Add_Caption;
       if frm_Add_Edit.showmodal = mrOk then
         begin
          With WriteProc do
           begin
              StoredProcName := 'ST_DT_SOTR_INSERT';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsVariant := null;
              ParamByName('DOLG').AsString:=frm_Add_Edit.Posada_Edit.Text;
              ParamByName('FAMILIA').AsString:=frm_Add_Edit.Familia_Edit.Text;
              ParamByName('IMYA').AsString:=frm_Add_Edit.Name_Edit.Text;
              ParamByName('OTCHESTVO').AsString:=frm_Add_Edit.Otch_Edit.Text;
              ParamByName('PSEVDONIM').AsString:='-';
              ParamByName('FROM_REG').AsInteger:= 0;
              ExecProc;
              id_kod_new :=ParamByName('ID_KOD_NEW').AsInt64;
              try
              Transaction.Commit;
              Close;
              except
              SHOWmessage('Виникла помилка при виконанні процедури ST_DT_SOTR_INSERT');
              Transaction.Rollback;
              close;
              end;
           end;
         END;

     end;
            DATASET.CLOSEOPEN(TRUE);
            DataSet.Locate('ID_KOD', id_kod_new, []);
end;

procedure Tfrm_List_of_Propusk_Man.dxBarLargeButton1Click(Sender: TObject);
var  edit_item_id, SELECTED: int64;
begin
if List_Table.DataController.RecordCount = 0 then exit;

if MessageBox(Handle,PChar(Del_Caption),'Підтвердження...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

if ((dataset['NUM_PROP']<>-1) and (dataset['NUM_PROP']<> null))
then
begin
 showmessage('Не можливо видалити запис. Перепустка вже була надрукована.');
 exit;
end;

    edit_item_id:=DATASET['ID_KOD'];
    With WriteProc do
    begin
        StoredProcName := 'ST_DT_SOTR_DELETE';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('ID_KOD').AsInt64 := edit_item_id;
        ExecProc;
         try
          Transaction.Commit;
          Close;
         except
          SHOWmessage('Виникла помилка при виконанні процедури ST_DT_SOTR_DELETE');
          Transaction.Rollback;
          Close;
          raise;
          end;
    END;
 selected := List_table.DataController.FocusedRowIndex-1;
 Dataset.closeopen(true);
 List_table.DataController.FocusedRowIndex := selected;

end;

procedure Tfrm_List_of_Propusk_Man.List_TableDblClick(Sender: TObject);
begin
Edit_Action.Execute;
end;

procedure Tfrm_List_of_Propusk_Man.Edit_ActionExecute(Sender: TObject);
var  edit_item_id: int64;
begin
 frm_Add_Edit:=Tfrm_Add_Edit.create(self);
 frm_Add_Edit.caption:= Edit_Caption;
       frm_Add_Edit.Familia_Edit.Text:=dataset['FAMILIA'];
       frm_Add_Edit.Name_Edit.Text:=dataset['IMYA'];
       frm_Add_Edit.Otch_Edit.Text:=dataset['OTCHESTVO'];
       frm_Add_Edit.Posada_Edit.Text:=dataset['DOLG'];
              edit_item_id:=dataset['ID_KOD'];
       if frm_Add_Edit.showmodal = mrOk then
         begin
          With WriteProc do
           begin
              StoredProcName := 'ST_DT_SOTR_UPDATE';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsInt64 := edit_item_id;
              ParamByName('DOLG').AsString:=frm_Add_Edit.Posada_Edit.Text;
              ParamByName('FAMILIA').AsString:=frm_Add_Edit.Familia_Edit.Text;
              ParamByName('IMYA').AsString:=frm_Add_Edit.Name_Edit.Text;
              ParamByName('OTCHESTVO').AsString:=frm_Add_Edit.Otch_Edit.Text;
              ParamByName('PSEVDONIM').AsString:=DATASET['PSEVDONIM'];
              ParamByName('FROM_REG').AsString:= DATASET['FROM_REG'];
              ExecProc;
              try
              Transaction.Commit;
              Close;
              except
              SHOWmessage('Виникла помилка при виконанні процедури ST_DT_SOTR_UPDATE');
              Transaction.Rollback;
              close;
              end;
           end;
         DATASET.CLOSEOPEN(TRUE);
         DataSet.Locate('ID_KOD', edit_item_id, []);
         END;

end;

procedure Tfrm_List_of_Propusk_Man.Edit_ButtonClick(Sender: TObject);
begin
if List_Table.DataController.RecordCount = 0 then exit;
Edit_Action.Execute;
end;

procedure Tfrm_List_of_Propusk_Man.Filter_BarEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var  persent : string;
begin
if  key=VK_RETURN then begin
 Screen.Cursor:=crHourGlass;
  persent:='%';
  DataSet.Close;
  DataSet.SelectSQL.Clear;
  DataSet.SelectSQL.Text:='select * from  ST_DT_SOTR_SELECT_FILTER_ASC('+ ''''+Filter_BarEdit.Text + persent+''''+')';
  DataSet.Open;
  List_Grid.setfocus;
 Screen.Cursor:=crdefault;
end;
end;


end.
