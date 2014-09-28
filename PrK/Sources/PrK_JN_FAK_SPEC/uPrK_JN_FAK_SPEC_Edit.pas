unit uPrK_JN_FAK_SPEC_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxTextEdit, cxControls, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ImgList,uPrK_Resources,
  ExtCtrls, cxMaskEdit, cxButtonEdit, uPrK_JN_FAK_SPEC, uSpecKlassSprav,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmPUB_JN_FAK_SPEC_Edit = class(TForm)
    cxLabelFak: TcxLabel;
    cxLabelSpec: TcxLabel;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCancel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelFormCaption: TcxLabel;
    ImageSpravEdit: TImage;
    cxButtonCloseForm: TcxButton;
    cxButtonEditFak: TcxButtonEdit;
    cxButtonEditSpec: TcxButtonEdit;
    StoredProc: TpFIBStoredProc;
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditSpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditFakPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    IndexLanguage:Integer;
  public
    IndLangEdit    :integer;
    pID_SP_SPEC:Int64;
    pID_SP_DEPARTMENT:Int64;
    procedure inicCaption;virtual;
    constructor Create(aOwner: TComponent; AForAdd:Boolean);reintroduce;
  end;

implementation
uses
    uConstants, uCommonSp, Math;

{$R *.dfm}

constructor TfrmPUB_JN_FAK_SPEC_Edit.Create(aOwner: TComponent; AForAdd:Boolean);
begin
   IndLangEdit    :=SelectLanguage;

   inherited Create(aOwner);

    cxLabelFormCaption.Top   :=0;

   if AForAdd then
     begin
//       if TfrmJnFakSpec(aOwner).DSetMain.IsEmpty then
        begin
         pID_SP_DEPARTMENT:=-1;
         cxButtonEditFak.Text:='';
        end;
{       else
        begin
         pID_SP_DEPARTMENT:=TfrmJnFakSpec(aOwner).DSetMain['FAK_NAME'];
         cxButtonEditFak.Text:=TfrmJnFakSpec(aOwner).DSetMain['FAK_NAME'];
        end;       }
       pID_SP_SPEC:=-1;
       cxButtonEditSpec.Text:='';
     end
   else
     begin
       pID_SP_DEPARTMENT:=TfrmJnFakSpec(aOwner).DSetMain['ID_SP_DEPARTMENT'];
       pID_SP_SPEC:=TfrmJnFakSpec(aOwner).DSetMain['ID_SP_SPEC'];
       cxButtonEditFak.Text:=TfrmJnFakSpec(aOwner).DSetMain['FAK_NAME'];
       cxButtonEditSpec.Text:=TfrmJnFakSpec(aOwner).DSetMain['SPEC_NAME'];
     end;

   IndexLanguage:=uPrK_Resources.SelectLanguage;
   inicCaption;
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.ActionCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.FormShow(Sender: TObject);
begin
                                         {422-урк, 409-англ, 419-рус}
//    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLangEdit]),KLF_ACTIVATE);
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[IndLangEdit];
   ActionCancel.Caption     :=nActiont_Cansel[IndLangEdit];

   ActionOK.Hint            :=nHintActiont_OK[IndLangEdit];
   ActionCancel.Hint        :=nHintActiont_Cansel[IndLangEdit];
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.ActionOKExecute(Sender: TObject);
begin
  if (pID_SP_SPEC=-1) or (pID_SP_DEPARTMENT=-1) then
    begin
      prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgEmptyFields[IndexLanguage],mtInformation,[mbOK],IndexLanguage);
    end
  else
    begin
      ModalResult:=mrOk;
    end;
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.cxButtonEditSpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res:Variant;
begin
  Res:=ShowSprav(Self,TfrmJnFakSpec(self.Owner).DB.Handle,PUB_SP_SPEC,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
      pID_SP_SPEC          :=Res[0];//.AsInt64;
      cxButtonEditSpec.Text:=Res[1];//.AsString;
    end;
end;

procedure TfrmPUB_JN_FAK_SPEC_Edit.cxButtonEditFakPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
// создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(TfrmJnFakSpec(self.Owner).DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 1;
                // с возможностью редактирования
            FieldValues['AllowEdit'] := False;
                // выбираем только факультеты
            FieldValues['Id_Property'] := 77;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if not VarIsNull(sp.Output['ID_DEPARTMENT']) then
      begin
        pID_SP_DEPARTMENT:=sp.Output['ID_DEPARTMENT'];
        cxButtonEditFak.Text:=sp.Output['NAME_FULL'];
      end;
    sp.Free;
end;

end.
