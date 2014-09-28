unit U_Raise_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uCharControl, uFloatControl, uFControl,
  uLabeledFControl, uSpravControl, StdCtrls, Buttons, DB, FIBDataSet,
  pFIBDataSet, U_SPPost_DataModule;

type
  TAddRaiseForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qFSC_Raise: TqFSpravControl;
    qFFC_Percent: TqFFloatControl;
    qFDC_Beg: TqFDateControl;
    qFDC_End: TqFDateControl;
    pFIBDS_Raise: TpFIBDataSet;
    procedure qFSC_RaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    DMod:TDMSPPost;

    { Public declarations }
  end;

var
  AddRaiseForm: TAddRaiseForm;

implementation

{$R *.dfm}

uses uCommonSp, SpCommon, qFTools;

procedure TAddRaiseForm.qFSC_RaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
  try    // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(pFIBDS_Raise.Database.Handle);
                // модально
            FieldValues['ShowStyle'] := 0;
                // выбор
            FieldValues['Select'] := 1;
                // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;


    sp.Output.Open;

    if not sp.Output.IsEmpty then
     begin
       value:=sp.Output['id_raise'];
       pFIBDS_Raise.ParamByName('id_raise').AsInteger:=sp.Output['id_raise'];
       pFIBDS_Raise.ParamByName('act_date').AsDate:=Date;

       pFIBDS_Raise.Open;
       DisplayText:=pFIBDS_Raise['full_name'];
       qFFC_Percent.Value:=pFIBDS_Raise['RAISE_DEFAULT'];
       pFIBDS_Raise.Close;
     end;

{    while not sp.Output.Eof do
    begin
      RxMD_Raise.Open;
      RxMD_Raise.First;
      flag:=False;
      while (not RxMD_Raise.Eof)and(not flag) do
      begin
        flag:=RxMD_Raise['id_raise']=sp.Output['id_raise'];
        RxMD_Raise.Next;
      end;
      if not flag then
       begin
         RxMD_Raise.Append;
         RxMD_Raise['id_raise']:=sp.Output['id_raise'];
         RxMD_Raise.Post;

         RxMD_Raises.Append;
         RxMD_Raises['id_raise']:=sp.Output['id_raise'];
         RxMD_Raises['id_post_base_salary']:=id_bs;
         RxMD_Raises['name_post_salary']:=RxMD_PS['name_post_salary'];
         RxMD_Raises['pps_koef']:=RxMD_PS['pps_koef'];
         RxMD_Raises['id_post_salary']:=RxMD_PS['id_post_salary'];
         RxMD_Raises.Post;
       end;
      sp.Output.Next;
    end;
    Refresh;  }
  except on e:exception do
      MessageDlg('Не вдалося завантажити довідник "ASUP\SpRaise":'+#13+e.Message,mtError,[mbYes],0);
  end;
end;

procedure TAddRaiseForm.BitBtn1Click(Sender: TObject);
begin
  if VarIsNull(qFSC_Raise.Value) then
   begin
     ShowMessage('Не обрана надбавка!');
     ModalResult:=0;
     Exit;
   end;
  if VarIsNull(qFFC_Percent.Value) then
   begin
     ShowMessage('Не задан відсоток!');
     ModalResult:=0;
     Exit;
   end;
  if VarIsNull(qFDC_Beg.Value) then
   begin
     ShowMessage('Не має дати початку!');
     ModalResult:=0;
     Exit;
   end;
  if VarIsNull(qFDC_End.Value) then
   begin
     ShowMessage('Не має дати кінця');
     ModalResult:=0;
     Exit;
   end;
  if VarToDateTime(qFDC_End.Value)<=VarToDateTime(qFDC_Beg.Value) then
   begin
     ShowMessage('Дата кінця має бути більшою за дату початка!');
     ModalResult:=0;
     Exit;
   end;
  ModalResult:=MrOk;
end;

procedure TAddRaiseForm.BitBtn2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TAddRaiseForm.FormCreate(Sender: TObject);
begin
  qFAutoLoadFromRegistry(Self, nil);
end;

procedure TAddRaiseForm.FormDestroy(Sender: TObject);
begin
  qFAutoSaveIntoRegistry(Self, nil);
end;

end.
