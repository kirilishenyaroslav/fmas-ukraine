unit Personification_export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  cxMaskEdit, cxButtonEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  unit_zGlobal_Consts, zProc, cxLabel;

  function ExportToDBF(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id:Integer):Variant;stdcall;

type
  TFExport = class(TForm)
    DSetAnk: TpFIBDataSet;
    DbfExportAnk: THalcyonDataSet;
    NewDbfTableCreateAnk: TCreateHalcyonDataSet;
    SaveDialog: TSaveDialog;
    FileNameAnkEdit: TcxButtonEdit;
    DefaultTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StartBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    FileNameIndEdit: TcxButtonEdit;
    DSetInd: TpFIBDataSet;
    DbfExportInd: THalcyonDataSet;
    NewDbfTableCreateInd: TCreateHalcyonDataSet;
    ProgressBar2: TcxProgressBar;
    procedure StartBtnClick(Sender: TObject);
    procedure FileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDB_Handle:TISC_DB_HANDLE;
    pId:Integer;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id:Integer);reintroduce;
  end;


implementation

function ExportToDBF(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id:Integer):Variant;
var
  form:TFExport;
begin

  form:=TFExport.Create(AOwner,DB_HANDLE,Id);
  form.ShowModal;
  form.Free;
end;

Constructor TFExport.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id:Integer);
begin
  inherited Create(AOwner);
  PLanguageIndex := LanguageIndex;
  PDB_Handle:=DB_HANDLE;
  pId := Id;
  Caption := ExportBtn_Caption[PLanguageIndex];
  StartBtn.Caption := ExportBtn_Caption[PLanguageIndex];

  DSetAnk.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_ANKETA_S_EXP('+IntToStr(Id)+') order by tin';
  DSetInd.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICTION_EXPORT_S('+IntToStr(Id)+') order by tin';
end;

{$R *.dfm}

procedure TFExport.StartBtnClick(Sender: TObject);
var i:integer;
begin
if ( FileNameAnkEdit.Text<>'') and ( FileNameIndEdit.Text<>'') then
   try

    ProgressBar.Position := 0;
    ProgressBar2.Position := 0;

    DB.Handle := PDB_Handle;


    DSetAnk.Open;
    ProgressBar.Properties.Max:=DSetAnk.RecordCount;
    DSetAnk.Last;


    if FileExists(FileNameAnkEdit.Text) then DeleteFile(FileNameAnkEdit.Text);

    if (NewDbfTableCreateAnk.Execute) then
    begin
        DbfExportAnk.Exclusive:=True;
        DbfExportAnk.Open;
    end
        else
        begin
            ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
            Exit;
        end;

      while(not DbfExportAnk.Eof)
      do
        begin
          DbfExportAnk.Delete;
          DbfExportAnk.Next;
        end;



    DbfExportAnk.Close;
    DbfExportAnk.Exclusive:=False;
    DbfExportAnk.Open;
    DSetAnk.First;

    While not(DSetAnk.Eof)
    do
      begin
        DbfExportAnk.Append;
        for i:=0 to DbfExportAnk.FieldList.Count-1 do
            DbfExportAnk[DbfExportAnk.FieldList[i].FieldName]:=DSetAnk[DbfExportAnk.FieldList[i].FieldName];

        DbfExportAnk.Post;
        DSetAnk.Next;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;
      end;


    DSetInd.Open;
    ProgressBar2.Properties.Max:=DSetInd.RecordCount;
    DSetInd.Last;


    if FileExists(FileNameIndEdit.Text) then DeleteFile(FileNameIndEdit.Text);

    if (NewDbfTableCreateInd.Execute) then
    begin
        DbfExportInd.Exclusive:=True;
        DbfExportInd.Open;
    end
        else
        begin
            ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
            Exit;
        end;

      while(not DbfExportInd.Eof)
      do
        begin
          DbfExportInd.Delete;
          DbfExportInd.Next;
        end;



    DbfExportInd.Close;
    DbfExportInd.Exclusive:=False;
    DbfExportInd.Open;
    DSetInd.First;

    While not(DSetInd.Eof)
    do
      begin
        DbfExportInd.Append;
        for i:=0 to DbfExportInd.FieldList.Count-1 do
            DbfExportInd[DbfExportInd.FieldList[i].FieldName]:=DSetInd[DbfExportInd.FieldList[i].FieldName];

        DbfExportInd.Post;
        DSetInd.Next;
        ProgressBar2.Position:=ProgressBar2.Position+1;
        Application.ProcessMessages;
      end;

        DbfExportInd.Close;
        DbfExportAnk.Close;
        ZShowMessage(Finish_Caption[PLanguageIndex],GoodFinish_Text[PLanguageIndex],mtInformation,
                        [mbOk]);
        ModalResult := mrOk;
   except
    on e:exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
      if DSetAnk.Active then DSetAnk.Close;
      if DSetInd.Active then DSetInd.Close;
      if DefaultTransaction.InTransaction then DefaultTransaction.Rollback;
     end
   end
      else
        begin
            ZShowMessage(Error_Caption[PLanguageIndex],EFileNotSelected_Caption[PLanguageIndex],mtInformation,
                            [mbOk]);
        end;
end;

procedure TFExport.FileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   SaveDialog.FileName:='APM_ANK.dbf';
   if (SaveDialog.Execute) then
        begin
            FileNameAnkEdit.Text:=SaveDialog.FileName;
            DbfExportAnk.DatabaseName:=ExtractFileDir(FileNameAnkEdit.Text);
            DbfExportAnk.TableName:=ExtractFileName(FileNameAnkEdit.Text);

        end;
end;

procedure TFExport.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   SaveDialog.FileName:='APM_IND.dbf';
   if (SaveDialog.Execute) then
        begin

            FileNameIndEdit.Text:=SaveDialog.FileName;
            DbfExportInd.DatabaseName:=ExtractFileDir(FileNameIndEdit.Text);
            DbfExportInd.TableName:=ExtractFileName(FileNameIndEdit.Text);

        end;
end;

end.
