unit uBankExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  zProc;

  function ExportToBank(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          IdReestr:Integer):Variant;stdcall;
  exports ExportToBank;


type
  TBankExportForm = class(TForm)
    MainDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ResultDataset: TpFIBDataSet;
    DbfExport: THalcyonDataSet;
    NewDbfTableCreate: TCreateHalcyonDataSet;
    SaveDialog: TSaveDialog;
    SelectFileBox: TGroupBox;
    FileNameEdit: TcxTextEdit;
    OpenDialogBtn: TcxButton;
    ProgressBox: TGroupBox;
    Label1: TLabel;
    TnLabel: TLabel;
    ProgressBar: TcxProgressBar;
    StartBtn: TcxButton;
    Label2: TLabel;
    CountLabel: TLabel;
    CreateDBUniver: TCreateHalcyonDataSet;
    procedure StartBtnClick(Sender: TObject);
    procedure OpenDialogBtnClick(Sender: TObject);
  private
    is_univer:string;
    id_reestr:integer;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID:integer);reintroduce;
  end;

var
  BankExportForm: TBankExportForm;

implementation

function ExportToBank(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          IdReestr:Integer):Variant;
var
  form:TBankExportForm;
begin

  form:=TBankExportForm.Create(AOwner,DB_HANDLE,IdReestr);
//  form.ResultDataset.ParamByName('ID_SESSION').Value:=IdReestr;
  form.ShowModal;
  form.Free;
  ExportToBank:=1;

end;

Constructor TBankExportForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID:integer);
begin

  inherited Create(AOwner);
  MainDataBase.Connected:=False;
  MainDatabase.Handle:=DB_HANDLE;

  is_univer := ValueFieldZSetup(DB_HANDLE,'IS_UNIVER');
  id_reestr := id;
  if is_univer='T' then  ResultDataset.SQLs.SelectSQL.Text := 'select * from UV_SHEET_TO_BANK('+IntToStr(ID)+')'
                   else  ResultDataset.SQLs.SelectSQL.Text := 'SELECT ID_MAN,TN,FIO,SUMMA FROM UV_SHEET_TO_BANK_ALLDATA('+IntToStr(ID)+') ORDER BY TN';
end;

{$R *.dfm}

procedure TBankExportForm.StartBtnClick(Sender: TObject);
var   TotalRecord:Integer;
      Flag:boolean;
begin
Flag:=False;
if ( FileNameEdit.Text<>'') then
    begin


    ResultDataSet.Open;
    ResultDataSet.Last;
    Totalrecord:=ResultDataSet.RecordCount;
    ResultDataset.First;

    ProgressBar.Properties.Max:=TotalRecord;

    if is_univer='T' then Flag := CreateDBUniver.Execute
                     else Flag := NewDbfTableCreate.Execute;

    if Flag then
    begin
        DbfExport.Exclusive:=True;
        DbfExport.Open;
    end
        else
        begin
            ZShowMessage('Помилка!','Неможливо створити файл!',mtError,[mbOk]);
            Exit;
        end;

      while(not DbfExport.Eof)
      do
        begin
          DbfExport.Delete;
          DbfExport.Next;
        end;



    DbfExport.Close;
    DbfExport.Exclusive:=False;
    DbfExport.Open;


    While not(ResultDataSet.Eof)
    do
      begin
        TnLabel.Caption:=IntToStr(ResultDataSet['TN']);

        DbfExport.Append;

        if is_univer='F' then
        begin
          DbfExport['LSTBL']:=ResultDataSet['TN'];
          DbfExport['RLSUM']:=ResultDataSet['SUMMA'];
          DbfExport['RLKOD']:=129;
        end
        else
        begin
          DbfExport['ID_MAN']:=ResultDataset['ID_MAN'];
          DbfExport['TN']:=ResultDataset['TN'];
          DbfExport['FIO']:=ResultDataset['FIO'];
          DbfExport['SUMMA']:=ResultDataset['SUMMA'];
          DbfExport['ACCT_CARD']:=ResultDataset['ACCT_CARD'];
          DbfExport['TIN']:=ResultDataset['TIN'];
        end;

        DbfExport.Post;

        ResultDataSet.Next;

        CountLabel.Caption:=IntToStr(ProgressBar.Position+1);
        ProgressBar.Position:=ProgressBar.Position+1;

        Application.ProcessMessages;


      end;
        DbfExport.Close;
        ZShowMessage('Завершення','Данні вдало експортовано.',mtInformation,
                        [mbOk]);
      end
      else
        begin

            ZShowMessage('Увага!','Оберить файл для экспорту!',mtInformation,
                            [mbOk]);

        end;


end;

procedure TBankExportForm.OpenDialogBtnClick(Sender: TObject);
var
    Name,tmp:String;
    Year,Month,Day:Word;
begin
   DecodeDate(Date,Year,Month,Day);

   if (Day<10) then
        tmp:='0'+IntToStr(Day)
   else
        tmp:=IntToStr(Day);

   if is_univer='F' then Name:='z129'+tmp+IntToStr(Month)+'.dbf'
                    else Name:=IntToStr(id_reestr)+'.dbf';
   SaveDialog.FileName:=Name;

   if (SaveDialog.Execute) then
        begin

            FileNameEdit.Text:=SaveDialog.FileName;
            DbfExport.DatabaseName:=ExtractFileDir(FileNameEdit.Text);
            DbfExport.TableName:=ExtractFileName(FileNameEdit.Text);

        end;

end;

end.
