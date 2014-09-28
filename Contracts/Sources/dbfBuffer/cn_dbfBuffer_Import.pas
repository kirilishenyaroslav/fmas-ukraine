unit cn_dbfBuffer_Import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxProgressBar, DB,
  Halcn6db, StdCtrls, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc,
  cnConsts, cn_Common_Funcs;

type
  TfrmImportDBF = class(TForm)
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    OpenDialog1: TOpenDialog;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    HalcyonDataSet1: THalcyonDataSet;
    cxProgressBar1: TcxProgressBar;
    Label1: TLabel;
    StoredProc: TpFIBStoredProc;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PLanguageIndex: byte;
  end;

var
  frmImportDBF: TfrmImportDBF;

implementation

{$R *.dfm}
procedure TfrmImportDBF.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    cxButtonEdit1.Text:=OpenDialog1.FileName;
end;

procedure TfrmImportDBF.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportDBF.cxButton1Click(Sender: TObject);
var
  SFio, SFam, SIm, SOtch: string;
  p: integer;
begin
  if cxButtonEdit1.Text='' then Exit;
  Label1.Visible:=true;
  cxProgressBar1.Visible:=True;
  HalcyonDataSet1.TableName:=cxButtonEdit1.Text;
  HalcyonDataSet1.Open;
  Label1.Caption:='Records count: '+IntTostr(HalcyonDataSet1.RecordCount);
  cxProgressBar1.Properties.Max:=HalcyonDataSet1.RecordCount;
  Application.ProcessMessages;
  StoredProc.StoredProcName:='CN_VC_BUFFER_INSERT';
  while not HalcyonDataSet1.Eof do
  begin
    cxProgressBar1.Position:=HalcyonDataSet1.RecNo;
    if HalcyonDataSet1.FieldByName('KONTRAKT').AsInteger=1 then
    begin
      SFio:=HalcyonDataSet1.FieldByName('FIO_UKR').AsString;
      p:=Pos(' ', SFio);
      SFam:=Copy(SFio,1, p-1);
      SFio:=Copy(SFio,p+1,255);
      p:=Pos(' ', SFio);
      SIm:=Copy(SFio,1, p-1);
      SOtch:=Copy(SFio,p+1,255);
      try
        StoredProc.Transaction.StartTransaction;
        StoredProc.ParamByName('NUM_DOG').Value:=HalcyonDataSet1.FieldByName('NDOG').AsString;
        StoredProc.ParamByName('DATE_DOG').Value:=HalcyonDataSet1.FieldByName('DDOG').AsDateTime;
        StoredProc.ParamByName('DATE_BEG').Value:=HalcyonDataSet1.FieldByName('DND').AsDateTime;
        StoredProc.ParamByName('DATE_END').Value:=HalcyonDataSet1.FieldByName('DOD').AsDateTime;
        StoredProc.ParamByName('TIN').Value:=HalcyonDataSet1.FieldByName('TIN').AsString;
        StoredProc.ParamByName('FAMILIA').Value:=SFam;
        StoredProc.ParamByName('IMYA').Value:=SIm;
        StoredProc.ParamByName('OTCHESTVO').Value:=SOtch;
        StoredProc.ParamByName('DATE_RO').Value:=HalcyonDataSet1.FieldByName('GODR').AsDateTime;
        StoredProc.ParamByName('STAT').Value:=HalcyonDataSet1.FieldByName('POL').AsInteger;
        StoredProc.ParamByName('ID_FACUL').AsInt64:=HalcyonDataSet1.FieldByName('KOD_FAK').AsInteger;
        StoredProc.ParamByName('ID_SPEC').AsInt64:=HalcyonDataSet1.FieldByName('KOD_SPEC').AsInteger;
        StoredProc.ParamByName('ID_NATIONAL').AsInt64:=HalcyonDataSet1.FieldByName('KOD_GRAZHD').AsInteger;
        StoredProc.ParamByName('ID_FORM_STUD').AsInt64:=HalcyonDataSet1.FieldByName('KOD_FORM').AsInteger;
        StoredProc.ParamByName('ID_KAT_STUD').AsInt64:=HalcyonDataSet1.FieldByName('KOD_KAT').AsInteger;
        StoredProc.ParamByName('KURS').Value:=HalcyonDataSet1.FieldByName('KURS').AsInteger;
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
      except
        on E:Exception do begin
          StoredProc.Transaction.Rollback;
          ShowMessage(E.Message);
        end;
      end;
    end;
    Application.ProcessMessages;
    HalcyonDataSet1.Next;
  end;
end;

procedure TfrmImportDBF.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
  cxButton2.Caption :=cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
  cxButton1.Caption :=cnConsts.cn_VC_Import[PLanguageIndex];
end;

end.
