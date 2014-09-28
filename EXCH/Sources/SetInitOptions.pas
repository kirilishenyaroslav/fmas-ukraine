unit SetInitOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDataSet, pFIBDataSet, DB, RxMemDS, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxLookAndFeelPainters,
  StdCtrls, cxCheckBox, cxButtons;

type
  TSetInitOptions_Form = class(TForm)
    Shape1: TShape;
    TableComboBox: TcxDBLookupComboBox;
    MemoryData: TRxMemoryData;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    MemDataSource: TDataSource;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    CheckBox: TcxCheckBox;
    Label1: TLabel;
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TableComboBoxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetInitOptions_Form: TSetInitOptions_Form;

implementation

uses DataModule;

{$R *.dfm}

procedure TSetInitOptions_Form.ApplyButtonClick(Sender: TObject);
begin
 if TableComboBox.Text <> '' then ModalResult := mrOk;
end;

procedure TSetInitOptions_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TSetInitOptions_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataSet.Close;
 Action := caFree;
end;

procedure TSetInitOptions_Form.FormCreate(Sender: TObject);
begin
 DataSet.Open;
end;

procedure TSetInitOptions_Form.TableComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then ApplyButton.SetFocus;
end;

end.
