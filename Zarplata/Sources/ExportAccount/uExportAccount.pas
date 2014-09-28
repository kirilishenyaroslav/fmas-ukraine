unit uExportAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmMainExport,IBase, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, cxProgressBar, cxLabel,
  cxButtonEdit, cxSpinEdit, cxMaskEdit, Unit_NumericConsts,cxDropDownEdit,
  ZMessages, Unit_sprSubs_Consts,ZTypes,Dates,ZProc,PackageLoad,
  cxShellDlgs, cxShellBrowserDialog, Halcn6db, DB,z_uWaitForm;

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
    FileOpenGroup: TGroupBox;
    ProgressBar: TcxProgressBar;
    GroupBox1: TGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    GroupBox2: TGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    eFileNameEdit: TcxButtonEdit;
    SaveDialog: TSaveDialog;
    DbfExport: THalcyonDataSet;
    CreateDBAccount: TCreateHalcyonDataSet;
    procedure OpenFileDialogBtnClick(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplExit(Sender: TObject);
    procedure eFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PParameter:Timport;
  public
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    property Parameter:Timport read PParameter;
  end;

  function ShowExportAccount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                              stdcall;
  exports  ShowExportAccount;

var
  MainForm: TMainForm;

implementation
function ShowExportAccount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                              stdcall;
var
  form:TMainForm;
begin
   form:=TMainForm.Create(AOwner,DB_HANDLE);
   form.ShowModal;
   ShowExportAccount:=null;
end;

constructor TMainForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  MainDMexport                            := TMainDMexport.Create(AOWner);
  MainDMexport.MainDataBase.Connected     := False;
  MainDMexport.MainDatabase.Handle        := DB_HANDLE;
  PDb_Handle                              := DB_HANDLE;
  //**********************************************************
  MonthesList.Properties.Items.Text := GetMonthList;
  EditVidOpl.Text                   := IfThen(PParameter.Kod_VidOpl=0,'',IntToStr(PParameter.Kod_VidOpl));
  PParameter.Kod_Setup              := CurrentKodSetup(PDb_Handle);
  YearSpinEdit.Value                := YearMonthFromKodSetup(PParameter.Kod_Setup);
  MonthesList.ItemIndex             := YearMonthFromKodSetup(PParameter.Kod_Setup-1,False);
  eFileNameEdit.text:='';
end;




{$R *.dfm}

procedure TMainForm.OpenFileDialogBtnClick(Sender: TObject);
begin
{
if OpenDialog.Execute then
   begin
      FileNameEdit.Text                 := OpenDialog.FileName;
      MainDMexport.INFOKOM.DatabaseName := ExtractFileDir(OpenDialog.FileName);
      MainDMexport.INFOKOM.TableName    := ExtractFileName(OpenDialog.FileName);
   end;      }


end;

procedure TMainForm.StartBtnClick(Sender: TObject);
var
  RecordCount : integer;
  wf:TForm;
begin
  if (eFileNameEdit.Text='')   then
  begin
   ZShowMessage(TFSprSubs_InputError_Caption,'Оберіть файл для експорту',mtWarning,[mbOK]);
   Exit;
  end;

  if (not PParameter.Is_VidOpl)   then
  begin
   ZShowMessage(TFSprSubs_InputError_Caption,'Оберіть вид операції',mtWarning,[mbOK]);
   Exit;
  end;

  PParameter.Kod_Setup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);

  MainDMexport.DSetAccountData.Close;
  MainDMexport.DSetAccountData.SelectSQL.Text:='select * from Z_EXPORT_DATA_ACCOUNT(:KOD_SETUP,:ID_VIDOPL)';
  MainDMexport.DSetAccountData.ParamByName('KOD_SETUP').Value := PParameter.Kod_Setup;
  MainDMexport.DSetAccountData.ParamByName('ID_VIDOPL').Value := PParameter.Id_VidOpl;
  MainDMexport.DSetAccountData.Open;

  if (MainDMexport.DSetAccountData.IsEmpty) then
  begin
    ZShowMessage(TFSprSubs_InputError_Caption,'Немає данних для експортування',mtWarning,[mbOK]);
    Exit;
  end

  else
  begin
   // wf:=ShowWaitForm(self, zwfDoFunction);
    MainDMexport.DSetAccountData.FetchAll;
    RecordCount := MainDMexport.DSetAccountData.RecordCount;
    MainDMexport.DSetAccountData.First;

    CreateDBAccount.CreateFields.Clear;
    CreateDBAccount.CreateFields.Add('DAT;D;8;0');
    CreateDBAccount.CreateFields.Add('TIN;C;10;0');
    CreateDBAccount.CreateFields.Add('TN;N;8;0');
    CreateDBAccount.CreateFields.Add('SUM;N;16;2');
    CreateDBAccount.CreateFields.Add('FIO;C;60;0');

    ProgressBar.Properties.Max := RecordCount;
    ProgressBar.Position       := 0;

  //DeleteFile(PChar(DbfExport.DatabaseName + '\' + DbfExport.TableName));
    if not CreateDBAccount.Execute then
    begin
      ZShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
      Exit;
    end;

    DbfExport.Exclusive:=False;
    DbfExport.Open;

    try
      While not(MainDMexport.DSetAccountData.Eof) do
      begin
        DbfExport.Append;

        DbfExport['DAT'] := MainDMexport.DSetAccountData['DAT'];
        DbfExport['TIN'] := MainDMexport.DSetAccountData['TIN'];
        DbfExport['TN']  := MainDMexport.DSetAccountData['TN'];
        DbfExport['SUM'] := MainDMexport.DSetAccountData['SUMMA'];
        DbfExport['FIO'] := MainDMexport.DSetAccountData['FIO'];

        DbfExport.Post;
        MainDMexport.DSetAccountData.Next;

        ProgressBar.Position := ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;
    except
      on e:Exception do
      begin
        ZShowMessage('Помилка!', 'Неможливо зробити експорт!' + #13 + e.Message, mtError, [mbOk]);
        //CloseWaitForm(wf);
        exit;
      end;
    end;
    DbfExport.Close;
   // CloseWaitForm(wf);
    ZShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
  end;
end;

procedure TMainForm.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   MainDMexport.MainDatabase.Handle,zfsModal,
                   0,
                   ValueFieldZSetup(MainDMexport.MainDatabase.Handle,'Z_ID_SYSTEM'));
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
  SaveDialog.FileName:='Account_Data.dbf';
  if (SaveDialog.Execute) then
    begin
      eFileNameEdit.Text:=SaveDialog.FileName;
      DbfExport.DatabaseName:=ExtractFileDir(eFileNameEdit.Text);
      DbfExport.TableName:=ExtractFileName(eFileNameEdit.Text);
    end;
end;

end.
