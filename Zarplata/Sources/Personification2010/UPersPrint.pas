unit UPersPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxLabel, cxButtonEdit,
  cxSpinEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxGroupBox, StdCtrls, cxButtons,IBase,Dates,DateUtils,Zproc,PackageLoad,
  ZMessages,UDMPersonification,IniFiles;

type TPersonPrint = record
 Kod_Setup_Beg:integer;
 Kod_Setup_End:integer;
 ID_man:Integer;
 Fio:string;
 dataBeg:TDateTime;
 dataEnd:TDateTime;
end;

type
  TfmPersonPrint = class(TForm)
    Panel1: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxKodSetup: TcxGroupBox;
    MonthesListBeg: TcxComboBox;
    YearSpinEditBeg: TcxSpinEdit;
    BoxDataFilter: TcxGroupBox;
    EditDataFilter: TcxButtonEdit;
    LabelManData: TcxLabel;
    MonthesListEnd: TcxComboBox;
    YearSpinEditEnd: TcxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure EditDataFilterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure EditDataFilterExit(Sender: TObject);
  private
    PParameter:TPersonPrint;
    PDb_Handle:TISC_DB_HANDLE;
    procedure GetMan;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
    property Parameter:TPersonPrint read PParameter;

  end;



var
  fmPersonPrint: TfmPersonPrint;

implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'Personification';
const NameReport               = 'Reports\Zarplata\PersonificationPrint.fr3';
constructor TfmPersonPrint.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);

begin
 inherited Create(AOwner);
 PDb_Handle := ADB_Handle;
//******************************************************************************
 MonthesListBeg.Properties.Items.Text := GetMonthList;
 MonthesListEnd.Properties.Items.Text := GetMonthList;
 PParameter.Kod_Setup_Beg := CurrentKodSetup(PDb_Handle);
 YearSpinEditBeg.Value    := YearMonthFromKodSetup(PParameter.Kod_Setup_Beg);
 YearSpinEditEnd.Value    := YearMonthFromKodSetup(PParameter.Kod_Setup_Beg);
 MonthesListBeg.ItemIndex := YearMonthFromKodSetup(PParameter.Kod_Setup_Beg-1,False);
 MonthesListEnd.ItemIndex := YearMonthFromKodSetup(PParameter.Kod_Setup_Beg-1,False);
end;

procedure TfmPersonPrint.EditDataFilterPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Man:Variant;
begin
  Man := LoadPeopleModal(Self,PDb_Handle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  begin
    PParameter.ID_man    := Man[0];
    PParameter.Fio       := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
    LabelManData.Caption := PParameter.FIO;
    EditDataFilter.Text  := varToStr(Man[4]);
  end;
end;

procedure TfmPersonPrint.GetMan;
var Man:Variant;
begin
  if EditDataFilter.Text<>'' then
    begin
     // if StrToInt(ManBtnEdit.Text)=pFilter.Tn then Exit;
      Man:=ManByTn(StrToInt(EditDataFilter.Text),PDb_Handle);
      if VarArrayDimCount(Man)>0 then
        begin
          PParameter.ID_man    := Man[0];
          PParameter.Fio       := VarToStr(Man[2]);
          LabelManData.Caption := PParameter.FIO;
          EditDataFilter.Text  := Man[1];
        end;
    end
  else
    begin
      PParameter.ID_man:=-1;
      PParameter.Fio:='';
      LabelManData.Caption := '';
      EditDataFilter.Text  := '';
    end;
end;

procedure TfmPersonPrint.YesBtnClick(Sender: TObject);
var
  dateKod:TDate;
  IniFile:TIniFile;
  ViewMode:integer;
  PathReport:string;
  DataBegReport:string;
  DataEndReport:string;
begin
  if (EditDataFilter.Text='')   then
    begin
     ZShowMessage('Помилка','Оберіть фізичну особу',mtWarning,[mbOK]);
     Exit;
    end
  else
    begin
     DM:=TDM.Create(Self,PDb_Handle);
     dm.DSetConst.close;
     DM.DSetConst.SelectSQL.Text:= 'select GLBUHG_POST, GLAV_BUHG from Z_SETUP';
     PParameter.Kod_Setup_Beg := PeriodToKodSetup(YearSpinEditBeg.Value,MonthesListBeg.ItemIndex+1);
     PParameter.Kod_Setup_End := PeriodToKodSetup(YearSpinEditEnd.Value,MonthesListEnd.ItemIndex+1);
     if (PParameter.Kod_Setup_Beg>PParameter.Kod_Setup_End)   then
       begin
         ZShowMessage('Помилка','Некорректний період',mtWarning,[mbOK]);
         Exit;
       end;

     PParameter.dataBeg       := ConvertKodToDate(PParameter.Kod_Setup_Beg);
     dateKod                  := ConvertKodToDate(PParameter.Kod_Setup_End);
     PParameter.dataEnd       := EncodeDate(YearOf(dateKod), MonthOf(dateKod), 1) + DaysInMonth(dateKod) - 1;
   // try
      DataBegReport := DateToStr(PParameter.dataBeg);
      DataEndReport := DateToStr(PParameter.dataEnd);
      DM.PrintDataSet.Close;
      DM.PrintDataSet.SelectSQL.Text:='select * from Z_PERSONIFICATION_PRINT(:KOD_SETUP_BEG,:KOD_SETUP_END, :id_man) order by DATE_REPORT';
      DM.PrintDataSet.ParamByName('KOD_SETUP_BEG').Value := PParameter.Kod_Setup_Beg;
      DM.PrintDataSet.ParamByName('KOD_SETUP_END').Value := PParameter.Kod_Setup_End;
      DM.PrintDataSet.ParamByName('id_man').Value        := PParameter.ID_man;
      DM.PrintDataSet.Open;
      if not (DM.PrintDataSet.IsEmpty) then
      begin
        dm.DSetConst.open;
        IniFile    := TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
        ViewMode   := IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
        PathReport := IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
        IniFile.Free;
        DM.Report.Variables.Clear;
        DM.Report.Variables[' '+'User Category']:=NULL;
        DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
        DM.Report.Variables.AddVariable('User Category','DateBeg',''''+DataBegReport+' ''');
        DM.Report.Variables.AddVariable('User Category','DateEng',''''+DataEndReport+' ''');
        DM.Report.Variables.AddVariable('User Category','FIO_Buh',''''+DM.DSetConst['GLAV_BUHG']+' ''');
        DM.Report.Variables.AddVariable('User Category','Dolgnost_buh',''''+DM.DSetConst['GLBUHG_POST']+' ''');

        if zDesignReport then  DM.Report.DesignReport
        else DM.Report.ShowReport;
        DM.Report.Free;
      end
      else
      ShowMessage('Даних для формування справки немає');
    {except on E: Exception do
      begin
       ShowMessage('');
      end;
    end; }
    end;
end;

procedure TfmPersonPrint.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmPersonPrint.EditDataFilterExit(Sender: TObject);
begin
  GetMan;
end;

end.
