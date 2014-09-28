unit Win2DosImprt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, ComCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxButtons,
  ExtCtrls, Halcn6db, DB, cxShellDlgs, cxShellBrowserDialog, pfibDataSet,
  cxDropDownEdit, cxCalendar,pFibStoredProc;

type
  TfrmDosImport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    EdDBFOutputPath: TcxButtonEdit;
    Docs: TProgressBar;
    Provs: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    cxDateEdit1: TcxDateEdit;
    Label4: TLabel;
    Panel3: TPanel;
    procedure EdDBFOutputPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function CreateDBFFiles: Boolean;
  public
    { Public declarations }
  end;

var
  frmDosImport: TfrmDosImport;

implementation

uses  dmmain_book, FIBDataSet;

function TfrmDosImport.CreateDBFFiles: Boolean;
var CreateDBF:TCreateHalcyonDataSet;
    DBF      :THalcyonDataSet;
    Res      :Boolean;
begin

    //Создание реестра документов
    DBF             :=THalcyonDataSet.Create(nil);
    DBF.TableName   :='all_doc.dbf';

    ForceDirectories(EdDBFOutputPath.Text);
    DBF.DatabaseName:=EdDBFOutputPath.Text;

    CreateDBF      :=TCreateHalcyonDataSet.Create(nil);
    CreateDBF.AutoOverwrite:=true;
    CreateDBF.DBFTable:=DBF;
    with CreateDBF do
  	begin
	     CreateFields.Clear;
  	   CreateFields.Add('ID_DOC;C;16;0');
       CreateFields.Add('DATE_REG;D;8;0');
	     CreateFields.Add('DATE_PROV;D;8;0');
	     CreateFields.Add('NUM_DOC;C;12;0');
       CreateFields.Add('DATE_DOC;D;8;0');
       CreateFields.Add('SUMMA;N;16;2');
       CreateFields.Add('NOTE;C;180;0');
       CreateFields.Add('FIO;C;30;0');
       CreateFields.Add('TYPE_DOC;N;6;0');
       CreateFields.Add('KOD_BUHG;N;10;0');
       CreateFields.Add('PSEVDONIM;C;6;0');
       CreateFields.Add('DATE_STAMP;C;20;0');
       CreateFields.Add('DATETIME;N;14;0');
    end;

    if CreateDBF.Execute then Res:=true else Res:=false;
    DBF.Close;

    //Создание реестра проводок
    DBF.TableName  :='all_prov.dbf';
    DBF.DatabaseName:=EdDBFOutputPath.Text;
    CreateDBF.DBFTable:=DBF;
    with CreateDBF do
  	begin
	     CreateFields.Clear;
  	   CreateFields.Add('ID_PROV;C;16;0');
       CreateFields.Add('DATE_REG;D;8;0');
       CreateFields.Add('STORNO;C;1;0');
       CreateFields.Add('ID_OPER;N;16;0');
       CreateFields.Add('DB_ID_DOC;C;16;0');
       CreateFields.Add('DB_BAL_ID;C;5;0');
       CreateFields.Add('DB_SUB_ID;N;3;0');
       CreateFields.Add('DB_SYS;N;2;0');
       CreateFields.Add('DB_KOD_SM;N;4;0');
       CreateFields.Add('DB_KOD_RAZ;N;4;0');
       CreateFields.Add('DB_KOD_ST;N;4;0');
       CreateFields.Add('DB_DT_PROV;D;8;0');
       CreateFields.Add('KR_ID_DOC;C;16;0');
       CreateFields.Add('KR_BAL_ID;N;5;0');
       CreateFields.Add('KR_SUB_ID;N;3;0');
       CreateFields.Add('KR_SYS;N;2;0');
       CreateFields.Add('KR_KOD_SM;N;4;0');
       CreateFields.Add('KR_KOD_RAZ;N;4;0');
       CreateFields.Add('KR_KOD_ST;N;4;0');
       CreateFields.Add('KR_DT_PROV;D;8;0');
       CreateFields.Add('ID_DOG;C;16;0');
       CreateFields.Add('KOD_DOG;C;16;0');
       CreateFields.Add('SUMMA;N;16;2');
       CreateFields.Add('KOD_PAYER;C;16;0');
    end;
    if CreateDBF.Execute then Res:=true else Res:=false;
    DBF.Close;

    Result:=Res;
end;

{$R *.dfm}

procedure TfrmDosImport.EdDBFOutputPathPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
     if cxShellBrowserDialog1.Execute
     then begin
               EdDBFOutputPath.Text:=cxShellBrowserDialog1.Path;
     end;
end;

procedure TfrmDosImport.cxButton1Click(Sender: TObject);
var DocDBF,ProvDBF:THalcyonDataSet;
    ProvFromWinDS,DocFromWinDS:TpfibDataSet;
    CheckSP:TpFibStoredProc;
    i,j:Integer;
begin
     if CreateDBFFiles
     then begin
                //Подсоединяемся к файлу документов
                DocDBF             :=THalcyonDataSet.Create(nil);
                DocDBF.TableName   :='all_doc.dbf';
                DocDBF.DatabaseName:=EdDBFOutputPath.Text;
                DocDBF.Open;

                //Подсоединяемся к файлу проводок
                ProvDBF             :=THalcyonDataSet.Create(nil);
                ProvDBF.TableName   :='all_prov.dbf';
                ProvDBF.DatabaseName:=EdDBFOutputPath.Text;
                ProvDBF.Open;

                //Инициализация проверочной процедуры
                CheckSP:=TpFibStoredProc.Create(self);
                CheckSP.Database:=dmmain.MainDatabase;
                CheckSP.Transaction:=dmmain.ReadTransaction;
                CheckSP.StoredProcName:='WIN_TO_DOS_CHECK_DOC';
                CheckSP.Prepare;

                //Инициализация забора проводок
                ProvFromWinDS:=TpfibDataSet.Create(self);
                ProvFromWinDS.Database:=dmMain.MainDatabase;
                ProvFromWinDS.Transaction:=dmMain.ReadTransaction;

                //Забор документов за период
                DocFromWinDS:=TpfibDataSet.Create(self);
                DocFromWinDS.Database:=dmMain.MainDatabase;
                DocFromWinDS.Transaction:=dmMain.ReadTransaction;
                DocFromWinDS.SelectSQL.Text:='SELECT * FROM WIN_TO_DOS_DOC_IMPORT('+''''+DateToStr(cxDateEdit1.Date)+''''+')';
                panel3.Visible:=true;
                self.Update;
                Application.ProcessMessages;
                DocFromWinDS.Open;
                DocFromWinDS.FetchAll;
                DocFromWinDS.First;
                panel3.Visible:=false;
                Docs.Position:=0;
                Docs.Update;
                Docs.Max:=DocFromWinDS.RecordCount;
                Docs.Min:=1;
                Docs.Step:=1;
                for i:=1 to DocFromWinDS.RecordCount do
                begin
                       Docs.StepIt;
                       Application.ProcessMessages;

                       //Проверяем нужно ли нам забирать этот документ
                       if CheckSP.Open then CheckSP.Close;
                       CheckSP.Prepare;
                       CheckSP.ParamByName('PK_ID').AsInt64:=StrToInt64(DocFromWinDS.FieldByName('PK_ID').AsString);
                       CheckSP.ExecProc;
                       if (CheckSP.ParamByName('RESULT').AsInteger=1)
                       then begin
                                 //Добавляем документ в таблицу
                                 DocDBF.Insert;
                                 DocDBF.FieldByName('ID_DOC').AsString :=DocFromWinDS.FieldByName('ID_DOC').AsString;
                                 DocDBF.FieldByName('DATE_REG').Value  :=DocFromWinDS.FieldByName('DATE_REG').Value;
                                 DocDBF.FieldByName('DATE_PROV').Value :=DocFromWinDS.FieldByName('DATE_PROV').Value;
                                 DocDBF.FieldByName('NUM_DOC').Value   :=DocFromWinDS.FieldByName('NUM_DOC').Value;
                                 DocDBF.FieldByName('DATE_DOC').Value  :=DocFromWinDS.FieldByName('DATE_DOC').Value;
                                 DocDBF.FieldByName('SUMMA').Value     :=DocFromWinDS.FieldByName('SUMMA').Value;
                                 DocDBF.FieldByName('NOTE').Value      :=DocFromWinDS.FieldByName('NOTE').Value;
                                 DocDBF.FieldByName('FIO').Value       :=DocFromWinDS.FieldByName('FIO').Value;
                                 DocDBF.FieldByName('TYPE_DOC').Value  :=DocFromWinDS.FieldByName('TYPE_DOC').Value;
                                 DocDBF.FieldByName('KOD_BUHG').Value  :=DocFromWinDS.FieldByName('KOD_BUHG').Value;
                                 DocDBF.FieldByName('PSEVDONIM').Value :=DocFromWinDS.FieldByName('PSEVDONIM').Value;
                                 DocDBF.FieldByName('DATE_STAMP').Value:=DocFromWinDS.FieldByName('DATE_STAMP').Value;
                                 DocDBF.FieldByName('DATETIME').Value  :=DocFromWinDS.FieldByName('DATETIME').Value;
                                 DocDBF.Post;

                                 //Добавляем проводки в таблицу
                                 if ProvFromWinDS.Active then ProvFromWinDS.Close;
                                 ProvFromWinDS.SelectSQL.Text:='SELECT * FROM WIN_TO_DOS_PROV_IMPORT('+DocFromWinDS.FieldByName('PK_ID').AsString+')';
                                 ProvFromWinDS.Open;
                                 ProvFromWinDS.FetchAll;
                                 ProvFromWinDS.First;
                                 //Provs.Position:=0;
                                 //Provs.Update;
                                 //Provs.Min:=1;
                                 //Provs.Max:=ProvFromWinDS.RecordCount;
                                 //Provs.Step:=1;
                                 for j:=1 to ProvFromWinDS.RecordCount do
                                 begin
                                       ProvDBF.Insert;
                                       ProvDBF.FieldByName('ID_PROV').AsString    :=ProvFromWinDS.FieldByName('ID_PROV').AsString;
                                       ProvDBF.FieldByName('DATE_REG').Value      :=ProvFromWinDS.FieldByName('DATE_REG').Value;
                                       ProvDBF.FieldByName('STORNO').Value        :=ProvFromWinDS.FieldByName('STORNO').Value;
                                       ProvDBF.FieldByName('ID_OPER').Value       :=ProvFromWinDS.FieldByName('ID_OPER').Value;
                                       ProvDBF.FieldByName('DB_ID_DOC').AsString  :=ProvFromWinDS.FieldByName('DB_ID_DOC').AsString;
                                       ProvDBF.FieldByName('DB_BAL_ID').Value     :=ProvFromWinDS.FieldByName('DB_BAL_ID').Value;
                                       ProvDBF.FieldByName('DB_SUB_ID').Value     :=ProvFromWinDS.FieldByName('DB_SUB_ID').Value;
                                       ProvDBF.FieldByName('DB_SYS').Value        :=ProvFromWinDS.FieldByName('DB_SYS').Value;
                                       ProvDBF.FieldByName('DB_KOD_SM').Value     :=ProvFromWinDS.FieldByName('DB_KOD_SM').Value;
                                       ProvDBF.FieldByName('DB_KOD_RAZ').Value    :=ProvFromWinDS.FieldByName('DB_KOD_RAZ').Value;
                                       ProvDBF.FieldByName('DB_KOD_ST').Value     :=ProvFromWinDS.FieldByName('DB_KOD_ST').Value;
                                       ProvDBF.FieldByName('DB_DT_PROV').Value    :=ProvFromWinDS.FieldByName('DB_DT_PROV').Value;
                                       ProvDBF.FieldByName('KR_ID_DOC').AsString  :=ProvFromWinDS.FieldByName('KR_ID_DOC').AsString;
                                       ProvDBF.FieldByName('KR_BAL_ID').Value     :=ProvFromWinDS.FieldByName('KR_BAL_ID').Value;
                                       ProvDBF.FieldByName('KR_SUB_ID').Value     :=ProvFromWinDS.FieldByName('KR_SUB_ID').Value;
                                       ProvDBF.FieldByName('KR_SYS').Value        :=ProvFromWinDS.FieldByName('KR_SYS').Value;
                                       ProvDBF.FieldByName('KR_KOD_SM').Value     :=ProvFromWinDS.FieldByName('KR_KOD_SM').Value;
                                       ProvDBF.FieldByName('KR_KOD_RAZ').Value    :=ProvFromWinDS.FieldByName('KR_KOD_RAZ').Value;
                                       ProvDBF.FieldByName('KR_KOD_ST').Value     :=ProvFromWinDS.FieldByName('KR_KOD_ST').Value;
                                       ProvDBF.FieldByName('KR_DT_PROV').Value    :=ProvFromWinDS.FieldByName('KR_DT_PROV').Value;
                                       ProvDBF.FieldByName('ID_DOG').AsString     :=ProvFromWinDS.FieldByName('ID_DOG').AsString;
                                       ProvDBF.FieldByName('KOD_DOG').AsString    :=ProvFromWinDS.FieldByName('KOD_DOG').AsString;
                                       ProvDBF.FieldByName('SUMMA').Value         :=ProvFromWinDS.FieldByName('SUMMA').Value;
                                       ProvDBF.FieldByName('KOD_PAYER').Value     :=ProvFromWinDS.FieldByName('KOD_PAYER').Value;
                                       ProvDBF.Post;
                                       ProvFromWinDS.Next;
                                       //Provs.StepIt;
                                       Application.ProcessMessages;
                                 end;//nexp prov
                       end;//result = 1
                       DocFromWinDS.Next;
                end;//next doc
                DocDBF.Close;

                ProvDBF.Close;
                Docs.Position:=Docs.Max;
                Docs.Update;

                DocDBF.Free;
                ProvDBF.Free;

                CheckSP.Close;
                CheckSP.Free;

                DocFromWinDS.Free;

                if ProvFromWinDS.Active then ProvFromWinDS.Close;
                ProvFromWinDS.Free;

     end;


     ShowMessage('Экспорт данних завершено!');
end;

procedure TfrmDosImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=CaFree;
end;

procedure TfrmDosImport.FormCreate(Sender: TObject);
begin
     cxDateEdit1.Date:=dmMain.MAIN_BOOK_DATE;
end;

end.
