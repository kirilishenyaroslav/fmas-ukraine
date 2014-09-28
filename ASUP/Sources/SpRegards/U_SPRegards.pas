{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{                 Работа со справочником регалий (Главный модуль)              }
{                                               ответственный: Тимофеев Антон  }

unit U_SPRegards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls, RxMemDS,
  cxGridCustomView, cxGrid, Buttons, ExtCtrls, FIBQuery, pFIBQuery,
  uSearchFrame, U_SPRegardsDM, IBase, U_SPRegards_Add, U_SPRegards_AddGr,
  SpCommon, ActnList;

type
  TForm_SPRegards = class(TForm)
    SpGridDBTableView1: TcxGridDBTableView;
    SpGridLevel1: TcxGridLevel;
    SpGrid: TcxGrid;
    DataSource1: TDataSource;
    SpGridDBTableView1DBGroup_Name: TcxGridDBColumn;
    SpGridDBTableView1DBShort_Name: TcxGridDBColumn;
    Panel1: TPanel;
    SpeedButton_AddOne: TSpeedButton;
    SpeedButton_UpdateOne: TSpeedButton;
    SpeedButton_DeleteOne: TSpeedButton;
    SpeedButton_Close: TSpeedButton;
    SpeedButton_AddGroup: TSpeedButton;
    SpeedButton_UpdateGroup: TSpeedButton;
    SpeedButton_DeleteGroup: TSpeedButton;
    Ok: TSpeedButton;
    SpeedButton_Refresh: TSpeedButton;
    SpGridDBTableView1DBFull_Name: TcxGridDBColumn;
    SearchFrame: TfmSearch;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxStyleRepository1: TcxStyleRepository;
    ActionList1: TActionList;
    AddRegardA: TAction;
    ModifRegardA: TAction;
    DelRegardA: TAction;
    AddGroupA: TAction;
    ModifGroupA: TAction;
    DelGroupA: TAction;
    UpA: TAction;
    DownA: TAction;
    SelectA: TAction;
    RefreshA: TAction;
    SpGridDBTableView1DBColumn1: TcxGridDBColumn;
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
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure SpeedButton_AddOneClick(Sender: TObject);
    procedure SpeedButton_DeleteOneClick(Sender: TObject);
    procedure SpeedButton_DeleteGroupClick(Sender: TObject);
    procedure SpeedButton_CloseClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure SpeedButton_RefreshClick(Sender: TObject);
    procedure SpeedButton_UpdateGroupClick(Sender: TObject);
    procedure SpeedButton_UpdateOneClick(Sender: TObject);
    procedure SpeedButton_AddGroupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpGridDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    Confirmation:Boolean;
    DMod:  TDMSPRegards;
    Input: TRxMemoryData;
    Output: TRxMemoryData;
    constructor Create(AOwner: TComponent; DataModule: TDMSPRegards;
              Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);reintroduce;
  end;

type Group_Id_Name=record
         Id:string;
         Name:string;
     end;

var
  Form_SPRegards: TForm_SPRegards;
  Res:Group_Id_Name;

type TShowMode = (smShowMod, smShowMChild, smSelMod, smSelMChild);
     TFormBtn  = (fbAdd, fbModif, fbDel);
     TFormButtons = set of TFormBtn;

const fbAll = [fbAdd, fbModif, fbDel];

function ShowRegards(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; id_group:Variant; confirm:boolean=true; Buttons:TFormButtons = fbAll):Boolean;

implementation

{$R *.dfm}

constructor TForm_SPRegards.Create(AOwner: TComponent; DataModule: TDMSPRegards; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
  inherited Create(AOwner);
  Self.DMod := DataModule;
//  Self.freeDM := FreeDataModule;
  Self.Input := Input;
  Self.Output := Output;

  if Input <> nil then
   begin
     Ok.Visible := (Input['Select'] <> 0);
     if Input['Select'] = 2 then
      SpGridDBTableView1.OptionsSelection.MultiSelect:=True;
   end;

//    CancelButton.Align := alRight;
//	SelectButton.Align := alRight;
end;

procedure TForm_SPRegards.SpeedButton_AddOneClick(Sender: TObject);
var Form_Add: TForm_SPRegards_Add;
begin
   Form_Add:=TForm_SPRegards_Add.Create(Self,DMod);
//   Form_Add.DMod:=DMod;
   Form_Add.Add:=True;
   if DMod.FIBDataSetFull['id_reg_group']<>Null then
    begin
      Form_Add.idgr:=StrToInt(DMod.FIBDataSetFull['id_reg_group']);
      Form_Add.SpComboBox_Group.Prepare(StrToInt(DMod.FIBDataSetFull['id_reg_group']),DMod.FIBDataSetFull['group_name']);
    end;
   Form_Add.ShowModal;
   Form_Add.Free;
   SpeedButton_Refresh.Click;
end;

procedure TForm_SPRegards.SpeedButton_DeleteOneClick(Sender: TObject);
begin
  if DMod.FIBDataSetFull.IsEmpty
   then begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetFull['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо видалити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+
           DMod.FIBDataSetFull['Group_Name']+', '+DMod.FIBDataSetFull['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_D('+IntToStr(FIBDataSetFull['Id_regard'])+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
  end;
  end;
  SpeedButton_Refresh.Click;
end;

procedure TForm_SPRegards.SpeedButton_DeleteGroupClick(
  Sender: TObject);
begin
  if DMod.FIBDataSetFull.IsEmpty
   then MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0)
   else
   begin
     if Confirmation
      then
      begin
        if (MessageDlg('Ви бажаєте вилучити групу "'+DMod.FIBDataSetFull['Group_Name']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
         then Exit;
        if (MessageDlg('Ви впевнені, що бажаєте вилучити групу "'+DMod.FIBDataSetFull['Group_Name']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
         then Exit;
      end;
     with DMod do
	   try
       FIBWriteTransaction.StartTransaction;
       FIBQuery.SQL.Text:='execute procedure SP_reg_GROUPs_D('+IntToStr(FIBDataSetFull['Id_reg_group'])+');';
       FIBQuery.ExecProc;
       FIBWriteTransaction.Commit;
     except on e: Exception do
     begin
       MessageDlg('Не вдалося вилучити запис: '+e.Message,mtError,[mbYes],0);
       FIBWriteTransaction.RollBack;
     end;
     end;
     SpeedButton_Refresh.Click;
   end;
end;

procedure TForm_SPRegards.SpeedButton_CloseClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	if FormStyle = fsMDIChild then Close;
end;

procedure TForm_SPRegards.OkClick(Sender: TObject);
var i,count:integer;
begin
      if DMod.FIBDataSetFull.IsEmpty then
      begin
      	ModalResult := mrCancel;
      end;

      Output.Open;

  count := SpGridDBTableView1.DataController.GetSelectedCount;
  if count>0 then
   for i:=0 to count-1 do
   begin
//     Locate('ID_raise',DBGridDBTableView1.DataController.GetRecordId(DBGridDBTableView1.Controller.SelectedRecords[i].RecordIndex),[]);;
      Output.Append;
      Output['Id_Regard'] := StrToInt(SpGridDBTableView1.Controller.SelectedRecords[i].Values[3]);
      Output['Full_Name'] := SpGridDBTableView1.Controller.SelectedRecords[i].Values[1];
      Output.Post;

   end else
   begin
     Output.Append;
     Output['Id_Regard'] := StrToInt(SpGridDBTableView1.Controller.SelectedRecords[i].Values[3]);
     Output['Full_Name'] := SpGridDBTableView1.Controller.SelectedRecords[i].Values[1];
     Output.Post;
   end;
	ModalResult := mrOk;
end;

procedure TForm_SPRegards.SpeedButton_RefreshClick(Sender: TObject);
var id:integer;
begin
  if DMod.FIBDataSetFull['Id_regard']=Null
   then begin
     DMod.FIBDataSetFull.Close;
     DMod.FIBDataSetFull.Open;
     SearchFrame.Refresh;
     SpGrid.Refresh; Exit;
   end;

  id:=DMod.FIBDataSetFull['Id_regard'];

  DMod.FIBDataSetFull.Close;
  DMod.FIBDataSetFull.Open;
  SearchFrame.Refresh;
  SpGrid.Refresh;

  DMod.FIBDataSetFull.Locate('Id_regard', Id, []);
end;

procedure TForm_SPRegards.SpeedButton_UpdateGroupClick(
  Sender: TObject);
var Form_Change_Group: TForm_SPRegards_AddGr;
begin
  if DMod.FIBDataSetFull.IsEmpty
   then MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0)
   else
   begin
     if Confirmation
      then if (MessageDlg('Чи ви справді бажаєте змінити назву групи: "'+
	    	       DMod.FIBDataSetFull['Group_Name']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
            then Exit;
     Form_Change_Group:=TForm_SPRegards_AddGr.Create(Self);
     Form_Change_Group.DMod:=DMod;
     Form_Change_Group.Id:=DMod.FIBDataSetFull['Id_reg_group'];
     Form_Change_Group.Add:=False;
     Form_Change_Group.ShowModal;
     SpeedButton_Refresh.Click;
   end;
end;

procedure TForm_SPRegards.SpeedButton_UpdateOneClick(Sender: TObject);
var Form_Change: TForm_SPRegards_Add;
begin
  if (DMod.FIBDataSetFull['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;

  if DMod.FIBDataSetFull.IsEmpty
   then MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0)
   else
   begin
     if Confirmation
      then if (MessageDlg('Чи ви справді бажаєте змінити регалію: "'+DMod.FIBDataSetFull['group_Name']+':'+
	    	      DMod.FIBDataSetFull['Full_Name']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
            then Exit;
     Form_Change:=TForm_SPRegards_Add.Create(Self,DMod);
//     Form_Change.DMod:=Dmod;
     with Form_Change do
     begin
       Add:=False;
       if DMod.FIBDataSetFull['id_reg_group']<>Null then
        begin
          Form_Change.idgr:=StrToInt(DMod.FIBDataSetFull['id_reg_group']);
          Form_Change.SpComboBox_Group.Prepare(StrToInt(DMod.FIBDataSetFull['id_reg_group']),DMod.FIBDataSetFull['group_name']);
        end;
       FC_Group.Required:=False;
       if not VarIsNull(DMod.FIBDataSetFull['Id_raise']) then
        begin
          IdRaise.Value:=DMod.FIBDataSetFull['Id_raise'];
          IdRaise.DisplayText:=DMod.FIBDataSetFull['raise_name'];
        end;
       Id:=DMod.FIBDataSetFull['Id_regard'];
       IdGr:=DMod.FIBDataSetFull['Id_reg_group'];
     //  Edit1.Text:= DMod.FIBDataSetFull['Full_Name'];
       if not VarIsNull(DMod.FIBDataSetFull['Full_Name']) then
        begin
          CE_FullName.Text:=DMod.FIBDataSetFull['Full_Name'];
        end;
       if not VarIsNull(DMod.FIBDataSetFull['Short_Name']) then
        begin
          CE_ShortName.Text:=DMod.FIBDataSetFull['Short_Name'];
        end;  
       ShowModal;
     end;
     SpeedButton_Refresh.Click;
  end;
end;

procedure TForm_SPRegards.SpeedButton_AddGroupClick(Sender: TObject);
var Form_Change_Group: TForm_SPRegards_AddGr;
begin
  Form_Change_Group:=TForm_SPRegards_AddGr.Create(Self);
  Form_Change_Group.DMod:=DMod;
  Form_Change_Group.Add:=True;
  Form_Change_Group.Caption:='Додати групу';
  Form_Change_Group.ShowModal;
  SpeedButton_Refresh.Click;
end;

//Процедура отображения формы справочника как MDI Child

function ShowRegards(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; id_group:Variant; confirm:boolean=true; Buttons:TFormButtons = fbAll):Boolean;
var RForm:TForm_SPRegards;
begin
  RForm:=TForm_SPRegards.Create(AOwner,nil);
  RForm.DMod := TDMSPRegards.Create(RForm);
  RForm.DMod.FIBDatabase.Handle := Handle;
  RForm.DMod.FibDataSetFull.SelectSQL.Clear;
  RForm.DMod.FibDataSetFull.ParamByName('Id_group').AsVariant:=id_group;
  if (id_group<>null) then
   begin
     RForm.SpeedButton_AddGroup.Enabled:=False;
     RForm.SpeedButton_DeleteGroup.Enabled:=False;
   end;
  RForm.DMod.FIBDataSetFull.Open;
  Rform.Confirmation:=confirm;

  if (SM=smShowMChild)or(SM=smShowMod)
   then RForm.Ok.Visible:=False;

  if fbAdd in Buttons then
   begin
     RForm.SpeedButton_AddOne.Enabled:=True;
   end
   else
   begin
     RForm.SpeedButton_AddOne.Enabled:=False;
     RForm.SpeedButton_AddGroup.Enabled:=False;
   end;

  if fbModif in Buttons then
   begin
     RForm.SpeedButton_UpdateOne.Enabled:=True;
     RForm.SpeedButton_UpdateGroup.Enabled:=True;
   end
   else
   begin
     RForm.SpeedButton_UpdateOne.Enabled:=False;
     RForm.SpeedButton_UpdateGroup.Enabled:=False;
   end;

  if fbDel in Buttons then
   begin
     RForm.SpeedButton_DeleteOne.Enabled:=True;
   end
   else
   begin
     RForm.SpeedButton_DeleteOne.Enabled:=False;
     RForm.SpeedButton_DeleteGroup.Enabled:=False;
   end;

  if (SM=smShowMChild)
   then RForm.FormStyle:=fsMDIChild
   else
   begin
     RForm.FormStyle:=fsNormal;
     RForm.Visible:=False;
     RForm.ShowModal;
   end;

   if (SM=smSelMod) then
    begin
      if RForm.ModalResult = mrCancel
       then
       begin
         Result:=False;
         Exit;
       end;
      Output:=RForm.Output;
    end;
    Result:=True;
end;

procedure TForm_SPRegards.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  SPDone;
 	if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TForm_SPRegards.SpeedButton1Click(Sender: TObject);
begin
  if DMod.FIBDataSetFull.IsEmpty
   then begin
     MessageDlg('Не можливо змінити порядок бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetFull['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте змінити порядок запису "'+
           DMod.FIBDataSetFull['Group_Name']+', '+DMod.FIBDataSetFull['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_Down('+IntToStr(FIBDataSetFull['Id_regard'])+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося змінити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
  end;
  end;
  SpeedButton_Refresh.Click;
end;

procedure TForm_SPRegards.SpeedButton2Click(Sender: TObject);
begin
  if DMod.FIBDataSetFull.IsEmpty
   then begin
     MessageDlg('Не можливо змінити порядок бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetFull['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте змінити порядок запису "'+
           DMod.FIBDataSetFull['Group_Name']+', '+DMod.FIBDataSetFull['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_Up('+IntToStr(FIBDataSetFull['Id_regard'])+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося змінити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
  end;
  end;
  SpeedButton_Refresh.Click;
end;

procedure TForm_SPRegards.FormShow(Sender: TObject);
begin
  if not DMod.FIBDatabase.Connected then
   begin
     DMod.FIBDatabase.Open;
   end;
  if not DMod.FIBDataSetFull.Active then
   DMod.FIBDataSetFull.Open;
//  SpInit(DMod.FIBDatabase.Handle);
  SearchFrame.Prepare(DMod.FIBDataSetFull,nil);
  DataSource1.DataSet:=Dmod.FIBDataSetFull;
end;

procedure TForm_SPRegards.SpGridDblClick(Sender: TObject);
begin
  if Ok.Visible then
   Ok.Click;
end;

procedure TForm_SPRegards.FormDestroy(Sender: TObject);
begin
 // SPDone;
  DMod.Free;
end;

end.
