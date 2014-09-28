unit uFrameFioAbit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxLabel,uPrK_Resources;

type
  TFrameFioAbit = class(TFrame)
    cxLabelFioAbit: TcxLabel;
    cxButtonEditFioAbit: TcxButtonEdit;
    procedure cxButtonEditFioAbitPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditFioAbitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
  end;

implementation

{$R *.dfm}
 uses
    uPRK_DT_ABIT,uConstants,AllPeopleUnit,
    AArray;
{ TFrameFioAbit }

procedure TFrameFioAbit.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    cxLabelFioAbit.Caption    := nLabelFioAbit[i];
    // Из-за этого будут ошибки при изменении данных абитуриента.... 10.12.06
    // А может и нет... 19.12.06
    cxButtonEditFioAbit.Text  := '';
    TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64:=-999;
end;

procedure TFrameFioAbit.cxButtonEditFioAbitPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   res : Variant;
   old_ID_MAN:int64;
begin
   res:=AllPeopleUnit.GetMan(Self, TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle, false, true);
   if   VarArrayDimCount(res) > 0 then
    begin
      if (res[0]<>null) and (res[1]<>null) then
      begin
        old_ID_MAN:= TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64   := res[0];
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['FIO_MAN'].AsString := VarToStr(res[1]);
        TFormPRK_DT_ABIT(self.Owner).cxLabelFioAbit.Caption                      := res[1];
        cxButtonEditFioAbit.Text                                                 := res[1];
        if old_ID_MAN<> res[0] then
         begin
          TFormPRK_DT_ABIT(self.Owner).TFrameDocEducation1.SelectTextFrameDocEducation:=true;
          TFormPRK_DT_ABIT(self.Owner).TFramePerevagi1.SelectTextFramePerevagi        :=true;
          TFormPRK_DT_ABIT(self.Owner).TFrameInLang1.SelectTextFrameInLang            :=true;
          TFormPRK_DT_ABIT(self.Owner).SelectTextFizlAbit                             :=true;
         end;
      end;
    end;
end;

procedure TFrameFioAbit.InicDataFrame(rejim :RejimPrK);
var
 Fio: String;
begin
if (rejim=ViewPrK) or (rejim=ChangePrK) then
 begin
    TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64   :=
              TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_MAN'];  // Колосов присылает не ID_MAN, а ID_DT_FIZL_ABIT
    Fio     :=TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['FIO'];
    TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['FIO_MAN'].AsString := Fio;
    TFormPRK_DT_ABIT(self.Owner).cxLabelFioAbit.Caption                      := Fio;
    cxButtonEditFioAbit.Text                                                 := Fio;
    {cxButtonEditFioAbit.Properties.ReadOnly:=true;
    cxButtonEditFioAbit.Properties.Buttons[0].Visible :=false;
    cxButtonEditFioAbit.Style.Color := TFormPRK_DT_ABIT(self.Owner).TextViewColor; }
    cxButtonEditFioAbit.Enabled:=false;
  end;
  
end;


procedure TFrameFioAbit.cxButtonEditFioAbitKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=CHR(0);
end;

end.
