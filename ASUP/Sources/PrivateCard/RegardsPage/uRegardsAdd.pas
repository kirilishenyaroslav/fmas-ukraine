unit uRegardsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uFControl, uLabeledFControl, uSpravControl, Buttons,uCommonSp,uRegardsDataModule,
  SpFormUnit,SpCommon, ActnList, DB, FIBDataSet, pFIBDataSet, cxLabel;

type
  TfrmregardsAdd = class(TForm)
    DateEdit: TcxDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qFSpravControl1: TqFSpravControl;
    NumDoc: TEdit;
    TemaDis: TEdit;
    ActionList1: TActionList;
    OkAct: TAction;
    CancelAct: TAction;
    RegardsSet: TpFIBDataSet;
    SpecSet: TpFIBDataSet;
    SprShifrSpec: TqFSpravControl;
    lblRegard: TcxLabel;
    lblShifr: TcxLabel;
    lblDateReg: TcxLabel;
    lblTheme: TcxLabel;
    lblNumDiplom: TcxLabel;
    SearchShifr: TEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure qFSpravControl1OpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSpravControl2OpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActExecute(Sender: TObject);
    procedure CancelActExecute(Sender: TObject);
    procedure SprShifrSpecOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SearchShifrChange(Sender: TObject);
    procedure NumDocEnter(Sender: TObject);
    procedure NumDocClick(Sender: TObject);
    procedure NumDocExit(Sender: TObject);
  private
    DmMod:TdmRegards;
    isCapsLockOn:Boolean;
    { Private declarations }
  public
     Hl,val1:Integer;
     constructor Create(AOwner:TComponent; DM:TdmRegards);reintroduce;
     procedure CapsLockClick;
     function isCapsLockClick:Boolean;
    { Public declarations }
  end;

var
  frmregardsAdd: TfrmregardsAdd;

implementation
uses uRegardsFrame;
{$R *.dfm}

constructor TfrmregardsAdd.Create(AOwner:TComponent; DM:TdmRegards);
begin
   inherited Create(AOwner);
   DmMod:=DM;
   isCapsLockOn:=isCapsLockClick;
end;

procedure TfrmregardsAdd.CapsLockClick;
begin
   keybd_event(VK_CAPITAL, 0, KEYEVENTF_EXTENDEDKEY, 0);
   keybd_event(VK_CAPITAL, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
end;

function TfrmregardsAdd.isCapsLockClick:Boolean;
var KeyState:TKeyboardState;
begin
   GetKeyboardState(KeyState);
   Result:=Boolean(Integer(KeyState[VK_CAPITAL]));
end;

procedure TfrmregardsAdd.cxButton1Click(Sender: TObject);
begin
    modalresult:=mrok;
end;

procedure TfrmregardsAdd.BitBtn1Click(Sender: TObject);
begin
    modalresult:=mrok;
end;

procedure TfrmregardsAdd.qFSpravControl1OpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRegards');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := hl;
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 2;
                // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;

    if sp.Output.IsEmpty then Exit;

    Value:=sp.Output['Id_Regard'];
    Val1:=sp.Output['Id_Regard'];
    DisplayText:=sp.Output['Full_Name'];
    end;

procedure TfrmregardsAdd.qFSpravControl2OpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('UP\SpSpec');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := hl;
            FieldValues['ModeEdit'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if ((not sp.Output.IsEmpty) and (sp.Output<>nil)) then
    begin
       Value:=sp.Output['Id_Spec'];
       DisplayText:=sp.Output['Name_Spec'];
    end;
end;

procedure TfrmregardsAdd.OkActExecute(Sender: TObject);
begin
    modalResult:=mrOk;
end;

procedure TfrmregardsAdd.CancelActExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TfrmregardsAdd.SprShifrSpecOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpSpecShifr');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := hl;
            FieldValues['ModeEdit'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if ((not sp.Output.IsEmpty) and (sp.Output<>nil)) then
    begin
       Value:=sp.Output['Id_Shifr_Spec'];
       DisplayText:=sp.Output['Name_Spec'];
    end;
end;

procedure TfrmregardsAdd.SearchShifrChange(Sender: TObject);
begin
   with DmMod do
   begin
      SearchShiftSet.Close;
      SearchShiftSet.SQLs.SelectSQL.Text:='select first(1) id_spec_shifr, num_shifr, name_spec '+
                           'from sp_spec_shifr '+
                           'where upper(num_shifr)=upper(:num_shifr)';
      SearchShiftSet.ParamByName('num_shifr').AsString:=SearchShifr.Text;
      SearchShiftSet.Open;
      if SearchShiftSet.IsEmpty then SprShifrSpec.DisplayText:='Не знайдено!'
      else
      begin
         SprShifrSpec.Value:=SearchShiftSet['id_spec_shifr'];
         SprShifrSpec.DisplayText:=SearchShiftSet['name_spec'];//SearchShiftSet['num_shifr']+' - '+SearchShiftSet['name_spec']
      end;
   end;
end;

procedure TfrmregardsAdd.NumDocEnter(Sender: TObject);
begin
   if not isCapsLockClick then CapsLockClick;
end;

procedure TfrmregardsAdd.NumDocClick(Sender: TObject);
begin
   if not isCapsLockClick then CapsLockClick;
end;

procedure TfrmregardsAdd.NumDocExit(Sender: TObject);
begin
   if isCapsLockOn=false then
   begin
      if isCapsLockClick then CapsLockClick;
   end;
   isCapsLockOn:=isCapsLockClick;
end;

end.


   
