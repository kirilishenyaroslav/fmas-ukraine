{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, uResources, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxClasses, uMatasVars, cxCheckBox, FIBDatabase,
  pFIBDatabase, uMatasUtils, uSplash, Kernel, ActnList;

type
  TfrmPeriod = class(TForm)
    Label1: TLabel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
   MatasMonth, MatasYear: Word;
  end;

var
  frmPeriod: TfrmPeriod;

implementation

{$R *.dfm}

uses dmMain, fmSplash;

procedure TfrmPeriod.FormShow(Sender: TObject);
begin
 cxMonth.ItemIndex:=MatasMonth-1;
 cxYear.Value:=MatasYear;
end;

procedure TfrmPeriod.OkButtonClick(Sender: TObject);
begin
 MatasYear:=cxYear.Value;
 MatasMonth:=cxMonth.ItemIndex+1;
 ModalResult:=mrOk;
end;

procedure TfrmPeriod.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_ACTION_SET_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 Label1.Caption:=MAT_STR_NEXT_PERIOD;
 LoadMonthTocxComboBox(cxMonth);
end;

procedure TfrmPeriod.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
