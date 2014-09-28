unit uDocumentType_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxControls, cxGroupBox, uConsts, ibase, uDocumentType_DM,
  cxCheckListBox;

type
  TfrmDocumentType_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    NameEdit: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    DocPropsList: TcxCheckListBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    DmE:TDocumentType_DM;
    procedure FormIniLanguage();
  public
    ID_NAME : int64;
    DB_Handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent; LanguageIndex : byte; IdDoc:Variant; DmMod:TDocumentType_DM);reintroduce;
  end;


 { frmDocumentType_AE: TfrmDocumentType_AE;}

implementation

uses DateUtils;

{$R *.dfm}

constructor TfrmDocumentType_AE.Create(AOwner:TComponent; LanguageIndex : byte; IdDoc:Variant; DmMod:TDocumentType_DM);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
  DecimalSeparator := ',';
  DmE:=DmMod;
  with DmE do
  begin
     if DocPropDSet.Active then DocPropDSet.Close;
     DocPropDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DOCUMENT_PROPS';
     DocPropDSet.Open;
     if not DocPropDSet.IsEmpty then
     begin
        DocPropDSet.FetchAll;
        DocPropDSet.First;
        while not DocPropDSet.Eof do
        begin
           DocPropsList.Items.Add.Text:=DocPropDSet['NAME_DOC_PROP'];
           DocPropDSet.Next;
        end;
        if not VarIsNull(IdDoc) then
        begin
           if DocPropDSet.Active then DocPropDSet.Close;
           DocPropDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_DOC_PROPS_BY_DOC_TYPE(:ID_DOC)';
           DocPropDSet.ParamByName('ID_DOC').AsInteger:=IdDoc;
           DocPropDSet.Open;
           if not DocPropDSet.IsEmpty then
           begin
              DocPropDSet.FetchAll;
              DocPropDSet.First;
              while not DocPropDSet.Eof do
              begin
                 DocPropsList.Items.Items[DocPropDSet['Id_Doc_Prop']-1].Checked:=True;
                 DocPropDSet.Next;
              end;
           end;
        end;
     end;
  end;
end;

procedure TfrmDocumentType_AE.FormIniLanguage;
begin
  NameLabel.caption          :=       uConsts.bs_name_document_type[PLanguageIndex];
      
  OkButton.Caption           :=       uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption       :=       uConsts.bs_Cancel[PLanguageIndex];
end;

procedure TfrmDocumentType_AE.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmDocumentType_AE.OkButtonClick(Sender: TObject);
begin
   if (NameEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити назву типу документа!');
       NameEdit.SetFocus;
       exit;
   end;


  ModalResult:=mrOk;
end;

end.
