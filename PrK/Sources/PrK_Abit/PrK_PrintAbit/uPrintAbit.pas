unit uPrintAbit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBDataSet, pFIBDataSet,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, IBase;

type
  TFormPrintAbit = class(TForm)
    cxButtonAbitPrintZAYAVA: TcxButton;
    cxButtonAbitPrinEKZ_LIST: TcxButton;
    cxButtonAbitPrinROSPISKA: TcxButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    StoredProc1: TpFIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonAbitPrinROSPISKAClick(Sender: TObject);
    procedure cxButtonAbitPrintZAYAVAClick(Sender: TObject);
    procedure cxButtonAbitPrinEKZ_LISTClick(Sender: TObject);
  private
    procedure InicCaption;
  public
    { Public declarations }
  end;

var
  FormPrintAbit: TFormPrintAbit;

implementation
uses
 uConstants,uPrK_Resources,uPRK_DT_ABIT,AArray,uPrK_Loader;
{$R *.dfm}

procedure TFormPrintAbit.FormCreate(Sender: TObject);
begin
    InicCaption;
end;

procedure TFormPrintAbit.InicCaption;
var
  i:Integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    TFormPrintAbit(self).Caption      :=nFormPtint_Caption[i];
    cxButtonAbitPrintZAYAVA.Caption   :=nButtonAbitPrintZAYAVA[i];
    cxButtonAbitPrinEKZ_LIST.Caption  :=nButtonAbitPrinEKZ_LIST[i];
    cxButtonAbitPrinROSPISKA.Caption  :=nButtonAbitPrinROSPISKA[i];
end;

procedure TFormPrintAbit.cxButtonAbitPrintZAYAVAClick(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'ZAYAVA';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ABIT';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ABIT';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;

    InputParam['Input']['Count_Param'].AsInteger        := 2;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  close;
end;


procedure TFormPrintAbit.cxButtonAbitPrinEKZ_LISTClick(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
  pDB_HANDLE:TISC_DB_HANDLE;
  pFotoPath:String;
begin
  i:=1;
  pFotoPath:=GetEnvironmentVariable('TEMP')+'\';
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'EKZ_LIST';
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ABIT';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    InputParam['Input']['Count_Param'].AsInteger        := 1;
// подменяем файл PRK_EKZ_LIST_FotoKartka.bmp на нужное фото
  pDB_HANDLE:=uPrK_Resources.GetImageDBHandle(TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle);
  if pDB_HANDLE<>nil then
    begin
      DB.Handle:=pDB_HANDLE;
      ReadTransaction.Active:=True;
      StoredProc1.StoredProcName:='FOTO_GET_CURRENT_BY_ID_MAN';
      StoredProc1.Prepare;
      StoredProc1.ParamByName('IN_ID_MAN').AsInteger:=TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT['ID_MAN'];
      StoredProc1.ExecProc;
      if not VarIsNull(StoredProc1.FN('FOTO').AsVariant) then
       begin
//        StoredProc1.FN('FOTO').SaveToFile(ExtractFilePath(Application.ExeName)+'\Reports\PrK\PRK_EKZ_LIST_Foto.jpg');
        StoredProc1.FN('FOTO').SaveToFile(pFotoPath+'PRK_EKZ_LIST_Foto.jpg');
        CopyFile(PAnsiChar(pFotoPath+'PRK_EKZ_LIST_Foto.jpg'),
                 PAnsiChar(pFotoPath+'PRK_EKZ_LIST_FotoKartka.jpg'),False);
       end
      else
        CopyFile(PAnsiChar(ExtractFilePath(Application.ExeName)+'\Reports\PrK\PRK_EKZ_LIST_Standard.jpg'),
                 PAnsiChar(pFotoPath+'PRK_EKZ_LIST_FotoKartka.jpg'),False);
      ReadTransaction.Active:=False;
    end
  else
        CopyFile(PAnsiChar(ExtractFilePath(Application.ExeName)+'\Reports\PrK\PRK_EKZ_LIST_Standard.jpg'),
                 PAnsiChar(pFotoPath+'PRK_EKZ_LIST_FotoKartka.jpg'),False);


  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  close;
end;

procedure TFormPrintAbit.cxButtonAbitPrinROSPISKAClick(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin

  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'ROZPISKA';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ABIT';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ABIT';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    InputParam['Input']['Count_Param'].AsInteger        := 2;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  close;
end;


end.
