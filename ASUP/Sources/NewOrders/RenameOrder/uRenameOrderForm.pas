unit uRenameOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ActnList, StdCtrls, Buttons, FIBDatabase,
  pFIBDatabase, uFControl, uInvisControl, uLabeledFControl, uSpravControl,
  uDateControl, uCharControl, AllPeopleUnit, qFTools;

type
  TfmRenameOrder = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    FormControl: TqFFormControl;
    IdOrderType: TqFInvisControl;
    NumItem: TqFInvisControl;
    SubItem: TqFInvisControl;
    IdOrderGroup: TqFInvisControl;
    Intro: TqFInvisControl;
    IdOrder: TqFInvisControl;
    IdMan: TqFSpravControl;
    GroupBox1: TGroupBox;
    OldFamilia: TqFCharControl;
    OldImya: TqFCharControl;
    OldOtchestvo: TqFCharControl;
    OldRusFamilia: TqFCharControl;
    OldRusImya: TqFCharControl;
    OldRusOtchestvo: TqFCharControl;
    GroupBox2: TGroupBox;
    NewFamilia: TqFCharControl;
    NewImya: TqFCharControl;
    NewOtchestvo: TqFCharControl;
    NewRusFamilia: TqFCharControl;
    NewRusImya: TqFCharControl;
    NewRusOtchestvo: TqFCharControl;
    Reason: TqFCharControl;
    DateOrder: TqFInvisControl;
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure IdManOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormControlAfterRecordAdded(Sender: TObject);
    { Private declarations }
  private
  
  public

  end;

var
  fmRenameOrder: TfmRenameOrder;

implementation

{$R *.dfm}

procedure TfmRenameOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmRenameOrder.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmRenameOrder.IdManOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    result : Variant;
begin
    try
        result := AllPeopleUnit.GetMan(Self, LocalDatabase.Handle, False, True);

        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];

            OldFamilia.Value := Result[2];
            OldImya.Value := Result[3];
            OldOtchestvo.Value := Result[4];
            OldRusFamilia.Value := Result[5];
            OldRusImya.Value := Result[6];
            OldRusOtchestvo.Value := Result[7];

            NewImya.Value := Result[3];
            NewOtchestvo.Value := Result[4];
            NewRusImya.Value := Result[6];
            NewRusOtchestvo.Value := Result[7];

            Reason.Value := 'Заява ' + result[2] + ' ' + Copy(result[3],1,1) +
                            '.' + Copy(result[4],1,1) + '.'; 
        end;

    except on e:Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                        e.Message + '"');
            exit;
        end;
    end;
end;

procedure TfmRenameOrder.FormControlAfterRecordAdded(Sender: TObject);
begin
    IdOrder.Value := FormControl.LastId;
end;

end.

procedure TfmRenameOrder.OkButtonClick(Sender: TObject);
begin

end;

