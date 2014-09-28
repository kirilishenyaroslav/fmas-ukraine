unit uPrKKlassSpravEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxTextEdit, cxControls, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ImgList,uPrK_Resources,
  ExtCtrls;

type
  TFormPrKKlassSpravEdit = class(TForm)
    cxLabelName: TcxLabel;
    cxLabelShortName: TcxLabel;
    cxLabelKod: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxTextEditShortName: TcxTextEdit;
    cxTextEditKod: TcxTextEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelFormCaption: TcxLabel;
    ImageSpravEdit: TImage;
    cxButtonCloseForm: TcxButton;
    cxLabelNPP: TcxLabel;
    cxTextEditNPP: TcxTextEdit;
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    DataPrKSpravEdit :TDataPrKSprav;
    AllDataKods    :variant;
    AllDataNpps    :variant;
    Layout: array[0.. KL_NAMELENGTH] of char;
  public
    IndLangEdit    :integer;
    procedure inicCaption;virtual;
    constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSprav;aAllDataKods: variant;
                       aAllDataNpps: variant);overload;
  end;

var
  FormPrKKlassSpravEdit: TFormPrKKlassSpravEdit;

implementation
uses
    uConstants,uPrKSpravEditStandart;

{$R *.dfm}

constructor TFormPrKKlassSpravEdit.Create(aOwner: TComponent; aDataPrKSprav: TDataPrKSprav;
                                          aAllDataKods: variant;aAllDataNpps: variant);
begin
   DataPrKSpravEdit :=aDataPrKSprav;
   IndLangEdit    :=SelectLanguage;

   inherited Create(aOwner);

    cxLabelFormCaption.Top   :=0;
    cxTextEditName.Text      :=DataPrKSpravEdit.Name;
    cxTextEditShortName.Text :=DataPrKSpravEdit.ShortName;
    cxTextEditKod.Text       :=IntToStr(DataPrKSpravEdit.Kod);
    cxTextEditNPP.Text       :=IntToStr(DataPrKSpravEdit.Npp);

   AllDataKods      :=aAllDataKods;
   AllDataNpps      :=aAllDataNpps;
   
   inicCaption;
   
end;

procedure TFormPrKKlassSpravEdit.cxTextEditKodKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPrKKlassSpravEdit.ActionOKExecute(Sender: TObject);
var
   parKod,parNpp: Integer;
begin
     if trim(cxTextEditKod.Text)=''
        then parKod:=Unassigned
        else parKod:=StrToInt(cxTextEditKod.Text);

     if trim(cxTextEditNPP.Text)=''
        then parNpp:=Unassigned
        else parNpp:=StrToInt(cxTextEditNpp.Text);

     case DataPrKSpravEdit.AddChangeData(DataPrKSpravEdit.Id,cxTextEditName.text,
                                         cxTextEditShortName.text,parKod,AllDataKods,parNpp,AllDataNpps) of
         EmptyName      :begin
                          ShowMessage(nMsgEmptyName[IndLangEdit]);
                          cxTextEditName.SetFocus;
                          exit;
                         end;
         EmptyShortName :begin
                          ShowMessage(nMsgEmptyShortName[IndLangEdit]);
                          cxTextEditShortName.SetFocus;
                          exit;
                         end;
         EmptyKod       :begin
                          ShowMessage(nMsgEmptyKod[IndLangEdit]);
                          cxTextEditKod.SetFocus;
                          exit;
                         end;
         ZerroKod       :begin
                          ShowMessage(nMsgZerroKod[IndLangEdit]);
                          cxTextEditKod.SetFocus;
                          exit;
                         end;
         ThisKodExist   :begin
                          ShowMessage(nMsgThisKodExist[IndLangEdit]);
                          cxTextEditKod.SetFocus;
                          exit;
                         end;
         /////
         EmptyNpp       :begin
                          ShowMessage(nMsgEmptyNpp[IndLangEdit]);
                          cxTextEditNPP.SetFocus;
                          exit;
                         end;
         ZerroNpp       :begin
                          ShowMessage(nMsgZerroNpp[IndLangEdit]);
                          cxTextEditNPP.SetFocus;
                          exit;
                         end;
         ThisNppExist   :begin
                          ShowMessage(nMsgThisNppExist[IndLangEdit]);
                          cxTextEditNPP.SetFocus;
                          exit;
                         end;

         AllDataOk     : ModalResult:=mrOk;
         else // может какое-нибудь получше сообщение выбрать
            ShowMessage('Неизвестное обращение к классу данных Справочников');
     end;

end;


procedure TFormPrKKlassSpravEdit.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormPrKKlassSpravEdit.FormShow(Sender: TObject);
begin
                                         {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLangEdit]),KLF_ACTIVATE);
end;

procedure TFormPrKKlassSpravEdit.inicCaption;
begin
   cxLabelName.Caption      := nLabelName[IndLangEdit];
   cxLabelShortName.Caption := nLabelShortName[IndLangEdit];
   cxLabelKod.Caption       := nLabelKod[IndLangEdit];
   cxLabelNPP.Caption       := nLabelNPP[IndLangEdit];

   ActionOK.Caption         :=nActiont_OK[IndLangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[IndLangEdit];

   ActionOK.Hint            :=nHintActiont_OK[IndLangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLangEdit];
end;

procedure TFormPrKKlassSpravEdit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

end.
