unit Sp_f1dfFirm_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox, Unit_Sp_VidOpl_Consts, cxButtonEdit, cxDropDownEdit,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, PackageLoad, ZTypes, IBase,
  ActnList, Unit_ZGlobal_Consts, ZProc;

type
  TZF1dfFirmControl = class(TForm)
    DirectorBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DSourceFund: TDataSource;
    DSourceNachisl: TDataSource;
    DataBase: TpFIBDatabase;
    DSetNachisl: TpFIBDataSet;
    DSetFund: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    GlavBuhgBox: TcxGroupBox;
    NameBox: TcxGroupBox;
    PeriodBox: TcxGroupBox;
    LabelDirectorTin: TcxLabel;
    ButtonEditDirectorTin: TcxButtonEdit;
    LabelDirector: TcxLabel;
    EditDirector: TcxLabel;
    LabelDirectorTel: TcxLabel;
    MaskEditDirectorTel: TcxMaskEdit;
    ButtonEditGlBuhgTin: TcxButtonEdit;
    LabelGlBuhgTin: TcxLabel;
    LabelGlBuhgTel: TcxLabel;
    MaskEditGlBuhgTel: TcxMaskEdit;
    LabelglBuhg: TcxLabel;
    EditGlBuhg: TcxLabel;
    MaskEditDPI: TcxMaskEdit;
    LabelDPI: TcxLabel;
    LabelKodDPI: TcxLabel;
    MaskEditKodDPI: TcxMaskEdit;
    LabelFileDa: TcxLabel;
    MaskEditFileDa: TcxMaskEdit;
    LabelOkpo: TcxLabel;
    MaskEditOkpo: TcxMaskEdit;
    LabelShortName: TcxLabel;
    MaskEditShortName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    MaskEditFullName: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ButtonEditDirectorTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditGlBuhgTinPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex:byte;
  public
    constructor Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

const
  Grant_Caption                     :array[1..2] of string = ('Стипендія','Стипендия');
  LabelKodSetup_Caption             :array[1..2] of string = ('Період стипендії','Период стипендии');
  LabelDefaultSmeta_Caption         :array[1..2] of string = ('Кошторис за умовчанням','Смета по умолчанию');
  LabelBudgetGrant_Caption          :array[1..2] of string = ('Властивість бюджетної стипендії','Свойство бюджетной стипендии');
  LabelPropFaculty_Caption          :array[1..2] of string = ('Факультети для стипендії','Факультеты для стипендии');
  VidOpl_Caption                    :array[1..2] of string = ('Види операцій','Виды операций');
  Other_Caption                     :array[1..2] of string = ('Інше','Другое');
  LabelCurrentKod_Caption           :array[1..2] of string = ('Поточний період','Текущий период');
  LabelDateBeg_Caption              :array[1..2] of string = ('Старт системи','Старт системы');
  LabelNachOk_Caption               :array[1..2] of string = ('Начальник відділа кадрів','Начальник отдела кадров');
  LabelDPI_Caption                  :array[1..2] of string = ('ДПІ','ДПИ');
  LabelKodDPI_Caption               :array[1..2] of string = ('Код ДПІ','Код ДПИ');
  LabelForwHol_Caption              :array[1..2] of string = ('Кіл-ть днів відпустки','Количество дней отпуска');
  LabelOrderLevel_Caption           :array[1..2] of string = ('Рівень','Уровень');
  System_Caption                    :array[1..2] of string = ('Система','Система');
  LabelZSystem_Caption              :array[1..2] of string = ('ІД системи','ИД система');
  LabelGrSystem_Caption             :array[1..2] of string = ('ІД стипендії','ИД стипендии');
  LabelRmoving_Caption              :array[1..2] of string = ('Виняткові періоди','Исключительные периоды');
  LabelIsFss_Caption                :array[1..2] of string = ('Утримувати податок соц. захисту','Удеривать налог социальной защиты');
  Labelvirtual_Caption              :array[1..2] of string = ('Віртуальний табель','Виртуальный табель');

constructor TZF1dfFirmControl.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);
begin
inherited Create(Aowner);
PLanguageIndex := LanguageIndex;
self.NameBox.Caption       :=LabelFirm_Caption[PLanguageIndex];
self.DirectorBox.Caption   := LabelDirector_Caption[PLanguageIndex];
self.GlavBuhgBox.Caption   := LabelGlavBuhg_Caption[PLanguageIndex];
self.LabelShortName.Caption:= LabelNameShort_Caption[PLanguageIndex];
self.LabelFullName.Caption := LabelNameFull_Caption[PLanguageIndex];
self.LabelOkpo.Caption     := LabelOkpo_Caption[PLanguageIndex];
LabelDirector.Caption      := LabelFIO_Caption[PLanguageIndex];
LabelDirectorTin.Caption   := LabelTin_Caption[PLanguageIndex];
LabelDirectorTel.Caption   := LabelTel_Caption[PLanguageIndex];
LabelglBuhg.Caption        := LabelFIO_Caption[PLanguageIndex];
LabelGlBuhgTin.Caption     := LabelTin_Caption[PLanguageIndex];
LabelGlBuhgTel.Caption     := LabelTel_Caption[PLanguageIndex];
LabelDPI.Caption           := LabelDPI_Caption[PLanguageIndex];
LabelKodDPI.Caption        := LabelKodDPI_Caption[PLanguageIndex];
LabelFileDa.Caption        := 'Файл';
self.YesBtn.Caption        := YesBtn_Caption[PLanguageIndex];
self.CancelBtn.Caption     := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
DataBase.Handle := ComeDB;
DefaultTransaction.StartTransaction;
end;

procedure TZF1dfFirmControl.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TZF1dfFirmControl.Action1Execute(Sender: TObject);
begin
 if MaskEditShortName.Text<>'' then
  if MaskEditFullName.Text<>'' then
   if ButtonEditDirectorTin.Text<>'' then
    if MaskEditDirectorTel.Text<>'' then
     if ButtonEditGlBuhgTin.Text<>'' then
      if MaskEditGlBuhgTel.Text<>'' then
       if MaskEditDPI.Text<>'' then
        if MaskEditKodDPI.Text<>'' then
         if MaskEditOkpo.Text<>'' then
          if MaskEditFileDa.Text<>'' then
          begin
            ModalResult:=mrYes;
          end
          else MaskEditFileDa.SetFocus
         else MaskEditOkpo.SetFocus
        else MaskEditKodDPI.SetFocus
       else MaskEditDPI.SetFocus
      else MaskEditGlBuhgTel.SetFocus
     else ButtonEditGlBuhgTin.SetFocus
    else MaskEditDirectorTel.SetFocus
   else ButtonEditDirectorTin.SetFocus
  else MaskEditFullName.SetFocus
 else MaskEditShortName.SetFocus;
end;

procedure TZF1dfFirmControl.ButtonEditDirectorTinPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadPeopleModal(Self,Database.Handle);
  if VarArrayDimCount(ResultView)> 0 then
  begin
    EditDirector.Caption  := VarToStr(ResultView[1])+' '+
                             VarToStr(ResultView[2])+' '+
                             VarToStr(ResultView[3]);
    ButtonEditDirectorTin.Text := VarToStr(ResultView[5]);
  end;
end;

procedure TZF1dfFirmControl.ButtonEditGlBuhgTinPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadPeopleModal(Self,Database.Handle);
  if VarArrayDimCount(ResultView)> 0 then
  begin
    EditGlBuhg.Caption    := VarToStr(ResultView[1])+' '+
                             VarToStr(ResultView[2])+' '+
                             VarToStr(ResultView[3]);
    ButtonEditGlBuhgTin.Text := VarToStr(ResultView[5]);
  end;
end;

end.
