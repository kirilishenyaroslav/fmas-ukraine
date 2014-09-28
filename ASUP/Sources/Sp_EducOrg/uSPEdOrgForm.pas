unit uSPEdOrgForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, RXMemDS,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxLabel,
  U_SPEducOrgDM, cxDBLabel, Buttons, uFormControl, ImgList;

type
  TSPEdOrgForm = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBLB_Add: TdxBarLargeButton;
    dxBLB_Modif: TdxBarLargeButton;
    dxBLB_Del: TdxBarLargeButton;
    DataSource1: TDataSource;
    SpEdOrg_ActList: TActionList;
    cxGrid_SpEdOrgView: TcxGridDBTableView;
    cxSpEdOrgLevel1: TcxGridLevel;
    cxSpEdOrg: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
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
    dxBLB_Select: TdxBarLargeButton;
    dxBLB_Cansel: TdxBarLargeButton;
    AddA: TAction;
    ModifA: TAction;
    DelA: TAction;
    OkA: TAction;
    CancelA: TAction;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel3: TPanel;
    FilterA: TAction;
    cxStyle12: TcxStyle;
    dxBLB_Refresh: TdxBarLargeButton;
    RefreshA: TAction;
    ImageList1: TImageList;
    cxGrid_SpEdOrgViewDBIdOrg: TcxGridDBColumn;
    cxGrid_SpEdOrgViewDBFullName: TcxGridDBColumn;
    cxGrid_SpEdOrgViewDBShortName: TcxGridDBColumn;
    cxGrid_SpEdOrgViewDBColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddAExecute(Sender: TObject);
    procedure ModifAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure OkAExecute(Sender: TObject);
    procedure CancelAExecute(Sender: TObject);
    procedure RefreshAExecute(Sender: TObject);
    procedure cxSpEdOrgDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Input, Output: TRxMemoryData;
    DMod : TDM_SPEducOrg;
    constructor Create(AOwner: TComponent; DataModule: TDM_SPEducOrg;
              Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);reintroduce;

    { Public declarations }
  end;

var
  SPEdOrgForm: TSPEdOrgForm;

implementation

uses U_SPEducOrg_Add, U_SPEducOrg_AddGr;

{$R *.dfm}

constructor TSPEdOrgForm.Create(AOwner: TComponent; DataModule: TDM_SPEducOrg; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.DMod := DataModule;
    Self.Input := Input;
    Self.Output := Output;
    DataSource1.DataSet := DMod.FIBDS_SelectOrg;
    DMod.FIBDS_SelectOrg.Open;
    if Input <> nil then
    begin

        OkA.Enabled := (Input['Select'] <> 0);
        if (Input['Select'] = 0) then
         dxBLB_Select.Visible := ivNever;

        cxGrid_SpEdOrgView.OptionsSelection.MultiSelect:=(Input['Select'] = 2);
    end;

end;


procedure TSPEdOrgForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle=fsMDIChild)
   then Action := caFree;
end;

procedure TSPEdOrgForm.AddAExecute(Sender: TObject);
var Form_Add: TForm_SPEducOrg_Add;
begin
   Form_Add:=TForm_SPEducOrg_Add.Create(Self,DMod,fmAdd,Null);
   Form_Add.ShowModal;
   Form_Add.Free;
   RefreshAExecute(Sender);
end;

procedure TSPEdOrgForm.ModifAExecute(Sender: TObject);
var Form_Change: TForm_SPEducOrg_Add;
begin
  if (DMod.FIBDS_SelectOrg['Id_org']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;

  if DMod.FIBDS_SelectOrg.IsEmpty
   then MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0)
   else
   begin
     if (MessageDlg('Чи ви справді бажаєте змінити: "'+DMod.FIBDS_SelectOrg['Name_Full']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
            then Exit;
     Form_Change:=TForm_SPEducOrg_Add.Create(Self,DMod,fmModify,DMod.FIBDS_SelectOrg['id_org']);
     Form_Change.ShowModal;
     Form_Change.Free;
     RefreshAExecute(Sender);
  end;
end;

procedure TSPEdOrgForm.DelAExecute(Sender: TObject);
begin
  if DMod.FIBDS_SelectOrg.IsEmpty
   then begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDS_SelectOrg['Id_org']=Null)
   then begin
     MessageDlg('Не можливо видалити пустий запис',mtError,[mbYes],0);
     exit;
   end;
{  if Confirmation
   then }if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+DMod.FIBDS_SelectOrg['Name_full']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBSpEducOrgWT.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_EducOrg_Delete('+IntToStr(FIBDS_SelectOrg['Id_org'])+');';
    FIBQuery.ExecProc;
    FIBSpEducOrgWT.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
    FIBSpEducOrgWT.RollBack;
  end;
  end;
  RefreshAExecute(Sender);
end;

procedure TSPEdOrgForm.OkAExecute(Sender: TObject);
var i,count:integer;
begin
      if DMod.FIBDS_SelectOrg.IsEmpty then
      begin
      	ModalResult := mrCancel;
      end;

      Output.Open;

  count := cxGrid_SpEdOrgView.DataController.GetSelectedCount;
  if count>0 then
   for i:=0 to count-1 do
   begin
//     Locate('ID_raise',DBGridDBTableView1.DataController.GetRecordId(DBGridDBTableView1.Controller.SelectedRecords[i].RecordIndex),[]);;
      Output.Append;
      Output['Id_EducOrg'] := StrToInt(cxGrid_SpEdOrgView.Controller.SelectedRecords[i].Values[0]);
      Output['Name_EducOrg'] := cxGrid_SpEdOrgView.Controller.SelectedRecords[i].Values[1];
      Output.Post;

   end else
   begin
     Output.Append;
     Output['Id_EducOrg'] := StrToInt(cxGrid_SpEdOrgView.Controller.SelectedRecords[0].Values[0]);
     Output['Name_EducOrg'] := cxGrid_SpEdOrgView.Controller.SelectedRecords[0].Values[1];
     Output.Post;
   end;
	ModalResult := mrOk;
end;

procedure TSPEdOrgForm.CancelAExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSPEdOrgForm.RefreshAExecute(Sender: TObject);
var id:integer;
begin
  if DMod.FIBDS_SelectOrg['Id_org']=Null
   then begin
     DMod.FIBDS_SelectOrg.Close;
     DMod.FIBDS_SelectOrg.Open;
//     SearchFrame.Refresh;
     {SpGrid.Refresh; }Exit;
   end;

  id:=DMod.FIBDS_SelectOrg['Id_org'];

  DMod.FIBDS_SelectOrg.Close;
  DMod.FIBDS_SelectOrg.Open;
//  SearchFrame.Refresh;
//  SpGrid.Refresh;

  DMod.FIBDS_SelectOrg.Locate('Id_org', Id, []);
end;

procedure TSPEdOrgForm.cxSpEdOrgDblClick(Sender: TObject);
begin
  if OkA.Enabled then OkAExecute(Sender);
end;

end.
