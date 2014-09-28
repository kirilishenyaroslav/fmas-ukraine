unit Unit_cn_fr_paymentAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, iBase, cn_common_types, cxControls, cxContainer,
  cxEdit, cn_Common_Loader, PackageLoad, ZTypes, DB, FIBDataSet,
  pFIBDataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit, Registry, cn_Common_Funcs,
  cxLabel;

type
  Tform_cn_fr_paymentAnalysis = class(TForm)
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    Print_dogs_list: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   InParameter : TcnSimpleParamsEx;
   IndexReg, Length_list : Integer;
   PLanguageIndex : Byte;
   Array_list : array of array [1..4] of string;
   constructor Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

  function frChooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports frChooseReport;

var
  form_cn_fr_paymentAnalysis: Tform_cn_fr_paymentAnalysis;

implementation

{$R *.dfm}
function frChooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var
  t:Tform_cn_fr_paymentAnalysis;
begin
  t:=Tform_cn_fr_paymentAnalysis.Create(AParameter);
  t.ShowModal;
  t.Free;
end;

constructor Tform_cn_fr_paymentAnalysis.Create(AParameter:TcnSimpleParamsEx);
begin
  inherited Create(AParameter.Owner);
  InParameter:=TcnSimpleParamsEx.Create;
  InParameter:=AParameter;

  PLanguageIndex := cnLanguageIndex();
end;

procedure Tform_cn_fr_paymentAnalysis.cxButtonCancelClick(Sender: TObject);
begin
 close;
end;

procedure Tform_cn_fr_paymentAnalysis.FormCreate(Sender: TObject);
begin
  Caption:='Друк';
  cxButtonOk.Caption:='Прийняти';
  cxButtonCancel.Caption:='Відмінити';
  cxLabel1.Caption := 'Шаблон документу';
end;

procedure Tform_cn_fr_paymentAnalysis.cxButtonOkClick(Sender: TObject);
Var
  id_man : Int64;
  Reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\Print_Dogs_list\', True)
    then reg.WriteString('index', IntToStr(Print_dogs_list.ItemIndex));
   finally
    reg.Free;
  end;

  if Array_list[Print_dogs_list.ItemIndex,4] <> 'PrintSprDoh' then
   begin
    RunFunctionFromPackage(InParameter, 'Contracts\' + Array_list[Print_dogs_list.ItemIndex,3], Array_list[Print_dogs_list.ItemIndex,4]);
   end;

  if Array_list[Print_dogs_list.ItemIndex,4] = 'PrintSprDoh' then
    begin
     //DB.Handle := InParameter.Db_Handle;
     //DB.Connected := True;
     //DataSet.Transaction.StartTransaction;
     DataSet.Close;
     DataSet.SQLs.SelectSQL.Text := 'select id_man from cn_dt_stud where id_stud = :id_stud';
     DataSet.ParamByName('id_stud').AsInt64 := InParameter.cnParamsToPakage.ID_STUD;
     DataSet.Open;
     if DataSet['id_man'] <> null
      then id_man := DataSet['id_man']
      else id_man := -1;

     //DataSet.Close;
     //DataSet.Transaction.Rollback;
     //DB.Connected := False;

     PrintSprSubs(InParameter.Owner,InParameter.Db_Handle, tsOther, id_man);
     //PrintSprSubs(InParameter.Owner, InParameter.Db_Handle, tsOther, Id_man);
     //PrintSprDoh(InParameter.Owner, InParameter.Db_Handle, tsOther, Id_man);
    End;
end;

procedure Tform_cn_fr_paymentAnalysis.FormShow(Sender: TObject);
var
  reg : TRegistry;
  i : Integer;
begin
  DB.Handle := InParameter.Db_Handle;
  DB.Connected := True;
  DataSet.Transaction.StartTransaction;

  DataSet.Close;
  DataSet.SQLs.SelectSQL.Text := 'Select * from CN_INI_PRINT_DOG_LIST';
  DataSet.Open;
  DataSet.FetchAll;
  Length_list := DataSet.RecordCount;

  SetLength(Array_list,Length_list);
  DataSet.First;
  i := 0;
  while not dataset.Eof do
   Begin
    if DataSet['NAME_UKR'] <> null
     then Array_list[i,1] := DataSet['NAME_UKR']
     else Array_list[i,1] := 'Невизначенно';

    if DataSet['NAME_RUS'] <> null
     then Array_list[i,2] := DataSet['NAME_RUS']
     else Array_list[i,2] := 'Неопределенно';

    if DataSet['NAME_MODULE'] <> null
     then Array_list[i,3] := DataSet['NAME_MODULE']
     else Array_list[i,3] := '';

    if DataSet['NAME_FUNCTION'] <> null
     then Array_list[i,4] := DataSet['NAME_FUNCTION']
     else Array_list[i,4] := '';

    i := i + 1;
    DataSet.Next;
   end;

  Print_dogs_list.Properties.Items.Clear;

  for i:=0 to Length_list-1 do Print_dogs_list.Properties.Items.Add(array_list[i, PLanguageIndex]);

  IndexReg := 0;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\Print_Dogs_list\',False)
    then indexReg := StrToInt(reg.ReadString('index'));
   finally
    reg.Free;
  end;

  if indexReg > Length_list
   then Print_dogs_list.ItemIndex := 0
   else Print_dogs_list.ItemIndex := IndexReg;
end;

procedure Tform_cn_fr_paymentAnalysis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If FormStyle = fsMDIChild
   then action:=caFree
   else
    begin
     DataSet.Close;
     ReadTransaction.Rollback;
     DB.Connected := False;
    End; 
end;

end.
