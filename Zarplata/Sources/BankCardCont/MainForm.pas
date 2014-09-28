unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  zProc, cxMaskEdit, cxButtonEdit, cxLabel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, pFibStoredProc,
  cxCheckBox, ExtCtrls, z_dmCommonStyles, XLSReadWriteII2;

  function BankCards(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;stdcall;
   exports BankCards;


type
  TBankCardsForm = class(TForm)
    DbfExport: THalcyonDataSet;
    SaveDialog: TSaveDialog;
    CreateDBUniver: TCreateHalcyonDataSet;
    LabelFile: TcxLabel;
    OpenDialog: TOpenDialog;
    DBFData: THalcyonDataSet;
    DSource: TDataSource;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClAcctCard: TcxGridDBColumn;
    GridClFamiliya: TcxGridDBColumn;
    GridClImya: TcxGridDBColumn;
    gridClIsWork: TcxGridDBColumn;
    GridClWorkEnd: TcxGridDBColumn;
    GridClIsStud: TcxGridDBColumn;
    GridClStudEnd: TcxGridDBColumn;
    GridClIsGrant: TcxGridDBColumn;
    GridClGrantEnd: TcxGridDBColumn;
    GridClPrim: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    DBFFilter: THalcyonDataSet;
    Panel2: TPanel;
    FileNameEdit: TcxButtonEdit;
    DoBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    SaveBtn: TcxButton;
    ExitBtn: TcxButton;
    CheckBoxUkrExim: TcxCheckBox;
    procedure SaveBtnClick(Sender: TObject);
    procedure FileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ExitBtnClick(Sender: TObject);
    procedure DoBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel2Resize(Sender: TObject);
  private
    pDBHandle:TISC_DB_HANDLE;
    pStylesDM:TStylesDM;
  public
    constructor Create(AOwner:TComponent;ADBHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

uses StrUtils;

function BankCards(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):Variant;
var form:TBankCardsForm;
begin
  form:=TBankCardsForm.Create(AOwner,ADB_Handle);
  form.Show;
end;

Constructor TBankCardsForm.Create(AOwner:TComponent;ADBHandle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  pDBHandle   := ADBHandle;
  //----------------------------------------------------------------------------
  Caption                                  := GetConst('CardBankCont',tcForm);
  //----------------------------------------------------------------------------
  pStylesDM                                := TStylesDM.Create(Self);
  GridDBTableView1.Styles.StyleSheet       := pStylesDM.GridTableViewStyleSheetDevExpress;
  //----------------------------------------------------------------------------
  DoBtn.Caption                            := GetConst('Do',tcButton);
  SaveBtn.Caption                          := GetConst('Save',tcButton);
  ExitBtn.Caption                          := GetConst('Exit',tcButton);
  //----------------------------------------------------------------------------
  GridClAcctCard.Caption                   := GetConst('AcctCard',tcGridColumn);
  GridClFamiliya.Caption                   := GetConst('Fam',tcGridColumn);
  GridClImya.Caption                       := GetConst('Imya',tcGridColumn);
  gridClIsWork.Caption                     := GetConst('Worker',tcGridColumn);
  GridClWorkEnd.Caption                    := GetConst('WorkEnd',tcGridColumn);
  GridClIsStud.Caption                     := GetConst('Student',tcGridColumn);
  GridClStudEnd.Caption                    := GetConst('StudEnd',tcGridColumn);
  GridClIsGrant.Caption                    := GetConst('Granter',tcGridColumn);
  GridClGrantEnd.Caption                   := GetConst('GrantEnd',tcGridColumn);
  GridClPrim.Caption                       := GetConst('Prim',tcGridColumn);
  //----------------------------------------------------------------------------
  WindowState := wsMaximized;
end;

{$R *.dfm}

procedure TBankCardsForm.SaveBtnClick(Sender: TObject);
var i:integer;
    RowIndex:integer;
    Flag:boolean;
    xls: TXLSReadWriteII2;
    PathTem1: string;
    PathTem2: string;
begin
  if not CheckBoxUkrExim.Checked then
    SaveDialog.DefaultExt:='dbf'
  else
    SaveDialog.DefaultExt:='xls';

  if SaveDialog.Execute then
  begin

    ProgressBar.Properties.Max:=GridDBTableView1.Controller.SelectedRowCount-1;
    ProgressBar.Position := 0;

    if not CheckBoxUkrExim.Checked then
    begin
      DBFFilter.DatabaseName := ExtractFileDir(SaveDialog.FileName);
      DBFFilter.TableName    := ExtractFileName(SaveDialog.FileName);

      CreateDBUniver.DBFTable := DBFFilter;
      Flag := CreateDBUniver.Execute;
      if Flag then
      begin
          DBFFilter.Exclusive:=True;
          DBFFilter.Open;
      end
      else
      begin
        ZShowMessage('Помилка!','Неможливо створити файл!',mtError,[mbOk]);
        Exit;
      end;

      while(not DBFFilter.Eof) do
      begin
          DBFFilter.Delete;
          DBFFilter.Next;
      end;

      DBFFilter.Close;
      DBFFilter.Exclusive:=False;
      DBFFilter.Open;
      for i:=0 to GridDBTableView1.Controller.SelectedRowCount-1 do
      begin
        RowIndex                  := GridDBTableView1.DataController.FilteredRecordIndex[i];
        DBFFilter.Append;
        DBFFilter['ACCT_CARD']    := GridDBTableView1.Controller.SelectedRows[i].Values[GridClAcctCard.Index];
        DBFFilter['FAMILIYA']     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClFamiliya.Index];
        DBFFilter['IMYA']         := GridDBTableView1.Controller.SelectedRows[i].Values[GridClImya.Index];
        DBFFilter['IS_STUD']      := GridDBTableView1.Controller.SelectedRows[i].Values[GridClIsStud.Index];
        DBFFilter['IS_WORK']      := GridDBTableView1.Controller.SelectedRows[i].Values[gridClIsWork.Index];
        DBFFilter['IS_GRANT']     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClIsGrant.Index];
        DBFFilter['DE_STUD']      := GridDBTableView1.Controller.SelectedRows[i].Values[GridClStudEnd.Index];
        DBFFilter['DE_WORK']      := GridDBTableView1.Controller.SelectedRows[i].Values[GridClWorkEnd.Index];
        DBFFilter['DE_GRANT']     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClGrantEnd.Index];
        DBFFilter['PRIM']         := GridDBTableView1.Controller.SelectedRows[i].Values[GridClPrim.Index];
        DBFFilter.Post;

        ProgressBar.Position      := ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;
      DBFFilter.Close;
    end
    else
    begin
      xls:= TXLSReadWriteII2.Create(Application);
      xls.Filename := ExtractFileName(SaveDialog.FileName);
      PathTem1:=xls.Filename;
      PathTem2:=(ExtractFilePath( Application.ExeName)+'\Reports\Zarplata\Podovgen.xls');
      if FileExists(PathTem1) then DeleteFile(PathTem1);
      CopyFile(pansichar(PathTem2), pansichar(PathTem1), true);
      xls.Read;
      xls.Sheet[0].AsString[1,1]:='ACCT_CARD';
      xls.Sheet[0].AsString[2,1]:='FAMILIYA';
      xls.Sheet[0].AsString[3,1]:='IMYA';
      xls.Sheet[0].AsString[4,1]:='IS_STUD';
      xls.Sheet[0].AsString[5,1]:='IS_WORK';
      xls.Sheet[0].AsString[6,1]:='IS_GRANT';
      xls.Sheet[0].AsString[7,1]:='DE_STUD';
      xls.Sheet[0].AsString[8,1]:='DE_WORK';
      xls.Sheet[0].AsString[9,1]:='DE_GRANT';
      xls.Sheet[0].AsString[10,1]:='PRIM';

      for i:=0 to GridDBTableView1.Controller.SelectedRowCount-1 do
      begin
        RowIndex                  := GridDBTableView1.DataController.FilteredRecordIndex[i];

        xls.Sheet[0].AsVariant[1,i+2]    := GridDBTableView1.Controller.SelectedRows[i].Values[GridClAcctCard.Index];
        xls.Sheet[0].AsVariant[2,i+2]     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClFamiliya.Index];
        xls.Sheet[0].AsVariant[3,i+2]         := GridDBTableView1.Controller.SelectedRows[i].Values[GridClImya.Index];
        xls.Sheet[0].AsVariant[4,i+2]     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClIsStud.Index];
        xls.Sheet[0].AsVariant[5,i+2]      := GridDBTableView1.Controller.SelectedRows[i].Values[gridClIsWork.Index];
        xls.Sheet[0].AsVariant[6,i+2]     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClIsGrant.Index];
        xls.Sheet[0].AsVariant[7,i+2]      := GridDBTableView1.Controller.SelectedRows[i].Values[GridClStudEnd.Index];
        xls.Sheet[0].AsVariant[8,i+2]      := GridDBTableView1.Controller.SelectedRows[i].Values[GridClWorkEnd.Index];
        xls.Sheet[0].AsVariant[9,i+2]     := GridDBTableView1.Controller.SelectedRows[i].Values[GridClGrantEnd.Index];
        xls.Sheet[0].AsVariant[10,i+2]        := GridDBTableView1.Controller.SelectedRows[i].Values[GridClPrim.Index];


        ProgressBar.Position      := ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;


      xls.write;
      xls.destroy;
    end;


  end;










end;

procedure TBankCardsForm.FileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if (OpenDialog.Execute) then FileNameEdit.Text:=OpenDialog.FileName;
end;

procedure TBankCardsForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBankCardsForm.DoBtnClick(Sender: TObject);
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    Flag: boolean;
begin
  DBFData.Close;
  DBFData.DatabaseName := ExtractFileDir(FileNameEdit.Text);
  DBFData.TableName    := ExtractFileName(FileNameEdit.Text);
  DBFData.Active       := True;

  GridDBTableView1.DataController.DataSource.DataSet := nil;
  DbfExport.Close;
  DbfExport.DatabaseName := DBFData.DatabaseName;
  DbfExport.TableName    := 'Result.dbf';


  CreateDBUniver.DBFTable := DbfExport;
  Flag := CreateDBUniver.Execute;
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

  while(not DbfExport.Eof) do
  begin
      DbfExport.Delete;
      DbfExport.Next;
  end;

  DbfExport.Close;
  DbfExport.Exclusive:=False;
  DbfExport.Open;
  ProgressBar.Properties.Max:=DBFData.RecordCount;
  ProgressBar.Position := 0;

  DBFData.First;

  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := pDBHandle;

    while not DBFData.EOF do
    try
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_ACCTCARD_CONT_CHECK';
       pStProc.Prepare;
       if not CheckBoxUkrExim.Checked then
       begin
        pStProc.ParamByName('ACCT_CARD').AsVariant := DBFData['ACCT_CARD'];
       end
       else
       begin
        pStProc.ParamByName('ACCT_CARD').AsVariant := DBFData['CONTRACT'];
       end;

       pStProc.ExecProc;


       DbfExport.Append;

       if not CheckBoxUkrExim.Checked then
       begin
        DbfExport['ACCT_CARD']    := DBFData['ACCT_CARD'];
        DbfExport['FAMILIYA']     := DBFData['FAMILIYA'];
        DbfExport['IMYA']         := DBFData['IMYA'];
       end
       else
       begin
        DbfExport['FAMILIYA']     := DBFData['LASTNAME'];
        DbfExport['IMYA']         := DBFData['FIRSTNAME'];
        DbfExport['ACCT_CARD']    := DBFData['CONTRACT'];
       end;

       DbfExport['IS_STUD']      := pStProc.ParamByName('IS_STUD').AsVariant;
       DbfExport['IS_WORK']      := pStProc.ParamByName('IS_WORK').AsVariant;
       DbfExport['IS_GRANT']     := pStProc.ParamByName('IS_GRANT').AsVariant;
       DbfExport['DE_STUD']      := pStProc.ParamByName('DATE_END_STUD').AsVariant;
       DbfExport['DE_WORK']      := pStProc.ParamByName('DATE_END_WORK').AsVariant;
       DbfExport['DE_GRANT']     := pStProc.ParamByName('DATE_END_GRANT').AsVariant;
       DbfExport['PRIM']         := pStProc.ParamByName('PRIM').AsVariant;

       DbfExport.Post;

       pStProc.Transaction.Commit;

       ProgressBar.Position      := ProgressBar.Position+1;
       Application.ProcessMessages;
       DBFData.Next;
    except

        pStProc.Transaction.Rollback;
        zShowMessage('Помилка','Можливо невірно обраний формат',mtError,[mbOK]);
        Exit;

    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
     GridDBTableView1.DataController.DataSource.DataSet := DbfExport;
  end;
end;

procedure TBankCardsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBankCardsForm.Panel2Resize(Sender: TObject);
begin
  ProgressBar.Width := Panel2.Width - 2*ProgressBar.Left;
  FileNameEdit.Width := Panel2.Width - 2*FileNameEdit.Left;
end;

end.
