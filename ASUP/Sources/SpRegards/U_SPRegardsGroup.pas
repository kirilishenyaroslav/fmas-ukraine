unit U_SPRegardsGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, uSearchFrame, Buttons, ExtCtrls, U_SPRegards_Add,
  U_SPRegardsDM, SpCommon;

type
  TSP_reg_group = class(TForm)
    Panel1: TPanel;
    SpeedButton_AddOne: TSpeedButton;
    SpeedButton_UpdateOne: TSpeedButton;
    SpeedButton_DeleteOne: TSpeedButton;
    SpeedButton_Close: TSpeedButton;
    Ok: TSpeedButton;
    SpeedButton_Refresh: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SearchFrame: TfmSearch;
    DataSource1: TDataSource;
    DBGrid: TDBGrid;
    procedure SpeedButton_AddOneClick(Sender: TObject);
    procedure SpeedButton_UpdateOneClick(Sender: TObject);
    procedure SpeedButton_DeleteOneClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton_RefreshClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    Confirmation:Boolean;
    { Public declarations }
  end;

var
  SP_reg_group: TSP_reg_group;

implementation

{$R *.dfm}

procedure TSP_reg_group.SpeedButton_AddOneClick(Sender: TObject);
var Form_Add: TForm_SPRegards_Add;
begin
   Form_Add:=TForm_SPRegards_Add.Create(Self);
   Form_Add.Add:=True;
   Form_Add.ShowModal;
   Form_Add.Free;
   SpeedButton_Refresh.Click;
end;

procedure TSP_reg_group.SpeedButton_UpdateOneClick(Sender: TObject);
var Form_Change: TForm_SPRegards_Add;
begin
  if (DMod.FIBDataSetGroup['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;

  if DMod.FIBDataSetGroup.IsEmpty
   then MessageDlg('Не можливо змінити запис бо довідник пустий',mtError,[mbYes],0)
   else
   begin
     if Confirmation
      then if (MessageDlg('Чи ви справді бажаєте змінити регалію: "'+DMod.FIBDataSetGroup['group_Name']+':'+
	    	      DMod.FIBDataSetGroup['Full_Name']+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo)
            then Exit;
     Form_Change:=TForm_SPRegards_Add.Create(Self);
     with Form_Change do
     begin
       Add:=False;
       SpComboBox_Group.Text:=DMod.FIBDataSetGroup['group_name'];
       SpComboBox_Group.Enabled:=False;
       FC_Group.Required:=False;
       Id:=DMod.FIBDataSetGroup['Id_regard'];
       IdGr:=DMod.FIBDataSetGroup['Id_reg_group'];
       CE_FullName.Text:=DMod.FIBDataSetGroup['Full_Name'];
       CE_ShortName.Text:=DMod.FIBDataSetGroup['Short_Name'];
       ShowModal;
     end;
     SpeedButton_Refresh.Click;
  end;
end;

procedure TSP_reg_group.SpeedButton_DeleteOneClick(Sender: TObject);
begin
  if DMod.FIBDataSetGroup.IsEmpty
   then begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetGroup['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо видалити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+
           DMod.FIBDataSetGroup['Group_Name']+', '+DMod.FIBDataSetGroup['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_D('+IntToStr(FIBDataSetGroup['Id_regard'])+');';
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

procedure TSP_reg_group.SpeedButton1Click(Sender: TObject);
begin
  if DMod.FIBDataSetGroup.IsEmpty
   then begin
     MessageDlg('Не можливо змінити порядок бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetGroup['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте змінити порядок запису "'+
           DMod.FIBDataSetGroup['Group_Name']+', '+DMod.FIBDataSetGroup['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_Down('+IntToStr(FIBDataSetGroup['Id_regard'])+');';
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

procedure TSP_reg_group.SpeedButton2Click(Sender: TObject);
begin
  if DMod.FIBDataSetGroup.IsEmpty
   then begin
     MessageDlg('Не можливо змінити порядок бо довідник пустий',mtError,[mbYes],0);
     exit;
   end;
  if (DMod.FIBDataSetGroup['Id_regard']=Null)
   then begin
     MessageDlg('Не можливо змінити пустий запис',mtError,[mbYes],0);
     exit;
   end;
  if Confirmation
   then if (MessageDlg('Чи ви справді бажаєте змінити порядок запису "'+
           DMod.FIBDataSetGroup['Group_Name']+', '+DMod.FIBDataSetGroup['full_Name']+
           '"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    FIBQuery.SQL.Text:='execute procedure SP_regards_Up('+IntToStr(FIBDataSetGroup['Id_regard'])+');';
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

procedure TSP_reg_group.SpeedButton_RefreshClick(Sender: TObject);
var id:integer;
begin
  if DMod.FIBDataSetGroup['Id_regard']=Null
   then begin
     DMod.FIBDataSetGroup.Close;
     DMod.FIBDataSetGroup.Open;
     SearchFrame.Refresh;
     DBGrid.Refresh; Exit;
   end;

  id:=DMod.FIBDataSetGroup['Id_regard'];

  DMod.FIBDataSetGroup.Close;
  DMod.FIBDataSetGroup.Open;
  SearchFrame.Refresh;
  DBGrid.Refresh;

  DMod.FIBDataSetGroup.Locate('Id_regard', Id, []);
end;

procedure TSP_reg_group.OkClick(Sender: TObject);
begin
	ModalResult := mrOk;
	{if FormStyle = fsMDIChild then }Close;
end;

procedure TSP_reg_group.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	ModalResult := mrCancel;
  	if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSP_reg_group.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet:=Dmod.FIBDataSetGroup;
  SearchFrame.Prepare(DMod.FIBDataSetGroup,nil);
  GridResize(DBGrid);
end;

procedure TSP_reg_group.FormResize(Sender: TObject);
begin
    GridResize(DBGrid);
end;

end.
