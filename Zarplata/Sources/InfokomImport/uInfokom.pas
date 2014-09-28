unit uInfokom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmMainInfocom,IBase, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, cxProgressBar, cxLabel,
  cxButtonEdit, cxSpinEdit, cxMaskEdit, Unit_NumericConsts,cxDropDownEdit,
  ZMessages, Unit_sprSubs_Consts,ZTypes,Dates,ZProc,PackageLoad,
  ExtCtrls, Buttons;

type Timport = record
 Id_VidOpl:integer;
 Kod_VidOpl:integer;
 Name_VidOpl:string;
 Kod_Setup:integer;
 Is_VidOpl:Boolean;
end;

type
  TMainForm = class(TForm)
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    OpenDialog: TOpenDialog;
    FileOpenGroup: TGroupBox;
    FileNameEdit: TcxTextEdit;
    OpenFileDialogBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    GroupBox1: TGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    GroupBox2: TGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    MessagesList: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SaveDialog: TSaveDialog;
    eFileNameEdit: TcxButtonEdit;
    BitBtn1: TBitBtn;
    procedure OpenFileDialogBtnClick(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplExit(Sender: TObject);
    procedure eFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PParameter:Timport;
  public
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    property Parameter:Timport read PParameter;
  end;

  function ShowInfokomImport(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                              stdcall;
  exports  ShowInfokomImport;

var
  MainForm: TMainForm;

implementation
function ShowInfokomImport(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                              stdcall;
var
  form:TMainForm;
begin
   form:=TMainForm.Create(AOwner,DB_HANDLE);
   form.ShowModal;
   ShowInfokomImport:=null;
end;

constructor TMainForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  eFileNameEdit.text:='';
  MessagesList.Perform(LB_SETHORIZONTALEXTENT, 1000, Longint(0));
  MainDMInfocom                        := TMainDMInfocom.Create(AOWner);
  MainDMInfocom.MainDataBase.Connected := False;
  MainDMInfocom.MainDatabase.Handle    := DB_HANDLE;
  PDb_Handle                           := DB_HANDLE;
  //**********************************************************
  MonthesList.Properties.Items.Text := GetMonthList;
  EditVidOpl.Text                   := IfThen(PParameter.Kod_VidOpl=0,'',IntToStr(PParameter.Kod_VidOpl));
  PParameter.Kod_Setup              := CurrentKodSetup(PDb_Handle);
  YearSpinEdit.Value                := YearMonthFromKodSetup(PParameter.Kod_Setup);
  MonthesList.ItemIndex             := YearMonthFromKodSetup(PParameter.Kod_Setup-1,False);
  ImportPanel.caption:='Перевірка даних';
  MessagesList.Clear;
end;




{$R *.dfm}

procedure TMainForm.OpenFileDialogBtnClick(Sender: TObject);
begin

if OpenDialog.Execute then
   begin
      FileNameEdit.Text:=OpenDialog.FileName;
      MainDMInfocom.INFOKOM.DatabaseName:=ExtractFileDir(OpenDialog.FileName);
      MainDMInfocom.INFOKOM.TableName:=ExtractFileName(OpenDialog.FileName);
   end;


end;

procedure TMainForm.StartBtnClick(Sender: TObject);
var
  s:string;
  i:Integer;
  is_import:Boolean;
begin
  MessagesList.Clear;
  if (FileNameEdit.Text='')   then
  begin
   ZShowMessage(TFSprSubs_InputError_Caption,'Оберіть файл для імпортування',mtWarning,[mbOK]);
   Exit;
  end;

  if (not PParameter.Is_VidOpl)   then
  begin
   ZShowMessage(TFSprSubs_InputError_Caption,'Оберіть вид операції',mtWarning,[mbOK]);
   Exit;
  end;

  MessagesList.Clear;
  is_import            := True;
  ImportPanel.caption  := 'Перевірка даних';
  PParameter.Kod_Setup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
  MainDMInfocom.INFOKOM.Close;
  MainDMInfocom.INFOKOM.Open;
  MainDMInfocom.INFOKOM.Last;
  ProgressBar.Properties.Max := MainDMInfocom.INFOKOM.RecordCount;
  MainDMInfocom.INFOKOM.First;
  MainDMInfocom.WriteTransaction.StartTransaction;
  while (not MainDMInfocom.INFOKOM.EOF)
  do
    begin
      s := MainDMInfocom.INFOKOM['FIO'];
      for i:=1 to Length(s) do
      begin
        if s[i]='i' then
        begin
         s[i]:='і';         //проблема с украинской 'і'
        end;

        if s[i]='I' then
        begin
         s[i]:='І';         //проблема с украинской 'І'
        end;
      end;
      MainDMInfocom.InsertProc.StoredProcName                 := 'Z_IMPORT_OUT_DATA_PROVERKA';
      //ShowMessage(IntToStr(MainDM.INFOKOM['TABN']));
      MainDMInfocom.InsertProc.ParamByName('TN').Value        := MainDMInfocom.INFOKOM['TABN'];
      MainDMInfocom.InsertProc.ParamByName('FIO').AsString    := s;
      MainDMInfocom.InsertProc.ParamByName('SUMMA').Value     := MainDMInfocom.INFOKOM['SUMP'];
      MainDMInfocom.InsertProc.ParamByName('KOD_SETUP').Value := PParameter.Kod_Setup;
      MainDMInfocom.InsertProc.ParamByName('ID_VIDOPL').Value := PParameter.Id_VidOpl;
      MainDMInfocom.InsertProc.ExecProc;
      MainDMInfocom.INFOKOM.Next;
      ProgressBar.Position:=ProgressBar.Position+1;
      if (MainDMInfocom.InsertProc.ParamByName('IS_IMPORT').Value = 0)then
      begin
        MessagesList.Items.Add('Помилка! '+ MainDMInfocom.InsertProc.ParamByName('ERROR').AsString);
        MessagesList.Perform(LB_SETHORIZONTALEXTENT, 2000, Longint(0));
        //MessagesList.()
        is_import:=False;
      end;
    end;
  MainDMInfocom.WriteTransaction.Commit;
  MainDMInfocom.INFOKOM.Close;

  if (is_import=True)  then
  begin
    ImportPanel.caption  := 'Імпорт даних';
    PParameter.Kod_Setup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
    MainDMInfocom.INFOKOM.Open;
    MainDMInfocom.INFOKOM.Last;
    ProgressBar.Properties.Max:=MainDMInfocom.INFOKOM.RecordCount;
    MainDMInfocom.INFOKOM.First;
    MainDMInfocom.WriteTransaction.StartTransaction;
    //try
      while (not MainDMInfocom.INFOKOM.EOF)
      do
        begin
          s:=MainDMInfocom.INFOKOM['FIO'];
          for i:=1 to Length(s) do
          begin
            if s[i]='i' then
            begin
             s[i]:='і';         //проблема с украинской 'і'
            end;

            if s[i]='I' then
            begin
              s[i]:='І';         //проблема с украинской 'І'
            end;
          end;
          MainDMInfocom.InsertProc.StoredProcName                 := 'Z_IMPORT_OUT_DATA';
          MainDMInfocom.InsertProc.ParamByName('TN').Value        := MainDMInfocom.INFOKOM['TABN'];
          MainDMInfocom.InsertProc.ParamByName('FIO').AsString    := s;
          MainDMInfocom.InsertProc.ParamByName('SUMMA').Value     := MainDMInfocom.INFOKOM['SUMP'];
          MainDMInfocom.InsertProc.ParamByName('KOD_SETUP').Value := PParameter.Kod_Setup;
          MainDMInfocom.InsertProc.ParamByName('ID_VIDOPL').Value := PParameter.Id_VidOpl;
          MainDMInfocom.InsertProc.ExecProc;
          MainDMInfocom.INFOKOM.Next;
          ProgressBar.Position:=ProgressBar.Position+1;
        end;
      MainDMInfocom.WriteTransaction.Commit;
      MainDMInfocom.INFOKOM.Close;
      ShowMessage('Данні ІНФОКОМ проімпортовані');
   { except on E:Exception do
      begin
        ShowMessage('Помилка! Данні ІНФОКОМ  НЕ проімпортовані');
        MainDM.WriteTransaction.Rollback;
      end;
    end; }

  end;  
end;

procedure TMainForm.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   MainDMInfocom.MainDatabase.Handle,zfsModal,
                   0,
                   ValueFieldZSetup(MainDMInfocom.MainDatabase.Handle,'Z_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PParameter.Is_VidOpl    := True;
   PParameter.Id_VidOpl    := VidOpl[0];
   PParameter.Kod_VidOpl   := VidOPl[2];
   PParameter.Name_VidOpl  := VidOpl[1];
   LabelVidOplData.Caption := PParameter.Name_VidOpl;
   EditVidOpl.Text         := IntToStr(PParameter.Kod_VidOpl);
  end
 else
  EditVidOpl.SetFocus;
end;

procedure TMainForm.EditVidOplExit(Sender: TObject);
var
  VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PParameter.Kod_VidOpl then Exit;
  VidOpl := VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ZCurrentVidOplProp);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PParameter.Is_VidOpl    := True;
    PParameter.Id_VidOpl    := VidOpl[0];
    PParameter.Kod_VidOpl   := VidOPl[1];
    PParameter.Name_VidOpl  := VidOpl[2];
    LabelVidOplData.Caption := PParameter.Name_VidOpl;
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TMainForm.eFileNameEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  SaveDialog.FileName:='ErrorProtokol.txt';
  if (SaveDialog.Execute) then
    begin
      eFileNameEdit.Text:=SaveDialog.FileName;
     // DbfExport.DatabaseName:=ExtractFileDir(eFileNameEdit.Text);
     // DbfExport.TableName:=ExtractFileName(eFileNameEdit.Text);
    end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  if (eFileNameEdit.Text='')   then
  begin
   ZShowMessage('Помилка','Оберіть файл для збереження протоколу',mtWarning,[mbOK]);
   Exit;
  end;
  if (MessagesList.Items.Text='')   then
  begin
   ZShowMessage('Помилка','Немає даних',mtWarning,[mbOK]);
   Exit;
  end;
  MessagesList.Items.SaveToFile(eFileNameEdit.Text);
  showmessage('Протокол збережен');
end;

end.
