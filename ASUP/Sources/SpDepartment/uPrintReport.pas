unit uPrintReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtonEdit, cxCheckBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ExtCtrls, uDepartmentsData, //uFormControl,
//  uBoolControl, uCharControl, uDateControl, uFControl, uLabeledFControl,
//  uSpravControl, uLogicCheck, uSimpleCheck, uInvisControl, uIntControl, DB,
  RxMemDS, uFControl, uLabeledFControl, uCharControl, uIntControl, DB,
  pFibDataSet, FIBDataSet, uDepartmentsView, IBase,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet, ActnList;
//  uSpravControl;

type
  TfrmPrintReport = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit: TcxDateEdit;
    cxButtonEdit: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    btnOK: TcxButton;
    Panel1: TPanel;
    Panel2: TPanel;
    pFIBDataSet1: TpFIBDataSet;
    ActionList1: TActionList;
    Design: TAction;
    Esc: TAction;
    procedure cxButtonEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnOKClick(Sender: TObject);
    procedure cxDateEditPropertiesChange(Sender: TObject);
    procedure cxDateEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure DesignExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private

  public
    Id_Property: int64;
    TITLE: string;
    dsgn : boolean;
    constructor Create(AOwner: TComponent{; DBHandle: TISC_DB_HANDLE});
  end;

var
  frmPrintReport: TfrmPrintReport;

implementation

{$R *.dfm}

uses uCommonSp, uSelectForm, cxGridTableView, cxGridDBTableView, cxGrid;

constructor TfrmPrintReport.Create(AOwner: TComponent{; DBHandle: TISC_DB_HANDLE});
begin
    inherited create(AOwner);
    Id_Property := -1;
end;

procedure TfrmPrintReport.cxButtonEditPropertiesButtonClick( Sender: TObject; AButtonIndex: Integer);
var
    frm:    TSelectForm;
begin
    try
    pFIBDataSet1.Close;
    pFIBDataSet1.SelectSQL.Text:='select ID_PROPERTY, NAME_PROPERTY from SP_DEP_PROP';
    frm := TSelectForm.Create( self, pFIBDataSet1 );
    frm.TableView.Items[0].Visible:=false;
    frm.TableView.Items[1].Caption:='Властивість';
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
        cxButtonEdit.Text:=VarToStr(frm.TableView.Controller.SelectedRows[0].Values[1]);
        Id_Property:=frm.TableView.Controller.SelectedRows[0].Values[0];
    end;
    frm.Free;
    except on E:exception
        do ShowMessage('Помилка! '+E.Message);
    end;

end;

procedure TfrmPrintReport.btnOKClick(Sender: TObject);
begin
    cxDateEditPropertiesChange(sender);
    ModalResult:=mrOk;
end;

procedure TfrmPrintReport.cxDateEditPropertiesChange(Sender: TObject);
begin
    if (cxDateEdit.Date > cxDateEdit.Properties.MaxDate) then cxDateEdit.Date := cxDateEdit.Properties.MaxDate;
    if (cxDateEdit.Date < cxDateEdit.Properties.MinDate) then cxDateEdit.Date := cxDateEdit.Properties.MinDate;
end;

procedure TfrmPrintReport.cxDateEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    cxDateEditPropertiesChange(sender);
end;

procedure TfrmPrintReport.DesignExecute(Sender: TObject);
begin
    dsgn := not dsgn;
end;

procedure TfrmPrintReport.EscExecute(Sender: TObject);
begin
    close;
end;

end.
