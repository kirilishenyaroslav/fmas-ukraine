unit uPrivateCardAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl,
  uCharControl, uIntControl, StdCtrls, Buttons, uFormControl, DB,
  FIBDataSet, pFIBDataSet, Ibase, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TfmPCardAdd = class(TForm)
    CardNumber: TqFIntControl;
    TN: TqFIntControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    pFIBDS_SelectNewTN: TpFIBDataSet;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
  public
    id_men:Integer;
    fio:String;
    constructor Create(AOwner: TComponent); reintroduce;
  end;


implementation

{$R *.dfm}

uses qFTools, UPrivateCardForm, GlobaLSpr, AllPeopleUnit;

constructor TfmPCardAdd.Create(AOwner: TComponent);
 var IntVaues:TpFibDataSet;
begin
     inherited Create(AOwner);

     IntVaues:=TpFibDataSet.Create(self);
     IntVaues.Database:=TfmPrivateCard(Owner).DB;
     IntVaues.Transaction:=TfmPrivateCard(Owner).ReadTransaction;
     IntVaues.SelectSQL.Text:='SELECT * FROM PRIVATE_CARDS_NEWPEOPLE';
     IntVaues.Open;
     IntVaues.FetchAll;
     if (IntVaues.RecordCount>0)
     then begin
               TN.Value:=IntVaues.FieldByName('TN').Value;
               CardNumber.Value:=IntVaues.FieldByName('CARD_NUMBER').Value;
     end;
     IntVaues.Close;
     IntVaues.Free;
end;

procedure TfmPCardAdd.OkButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfmPCardAdd.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;


procedure TfmPCardAdd.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    result : Variant;
begin
    try
        result := AllPeopleUnit.GetManForASUP(Self, TfmPrivateCard(Owner).DB.Handle, False, True);

        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            id_men := result[0];
            cxButtonEdit1.Text := result[1];
        end;

    except on e:Exception do begin
            qFErrorDialog('Неможливо завантажити дов_дник фізичних осіб! Виникла помилка: "' +
                        e.Message + '"');
            exit;
        end;
    end;
end;

end.
