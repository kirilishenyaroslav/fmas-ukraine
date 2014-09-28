unit UAdvancedSearch;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, ActnList,
    cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit;

type
    TAdvancedSearchForm = class(TForm)
        SearchGroup: TGroupBox;
        TinSearchBtn: TRadioButton;
        Label1: TLabel;
        OldFamiliaSearchBtn: TRadioButton;
        Label2: TLabel;
        ActionList1: TActionList;
        SelectAction: TAction;
        CancelAction: TAction;
        OldFamEdit: TcxMaskEdit;
        TinSearchEdit: TcxMaskEdit;
        SelectBtn: TcxButton;
        procedure TinSearchBtnClick(Sender: TObject);
        procedure OldFamiliaSearchBtnClick(Sender: TObject);
        procedure SelectActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        pParamNumber: Integer;
        pParamValue: string;
    end;

implementation

{$R *.dfm}

procedure TAdvancedSearchForm.TinSearchBtnClick(Sender: TObject);
begin
    TinSearchEdit.Enabled := True;
    TinSearchEdit.SetFocus;
    OldFamEdit.Enabled := False;
end;

procedure TAdvancedSearchForm.OldFamiliaSearchBtnClick(Sender: TObject);
begin
    TinSearchEdit.Enabled := False;
    OldFamEdit.Enabled := True;
    OldFamEdit.SetFocus;
end;

procedure TAdvancedSearchForm.SelectActionExecute(Sender: TObject);
begin
    if (TinSearchBtn.Checked) and (TinSearchEdit.Text <> '') then
    begin
        pParamNumber := 1;
        pParamValue := TinSearchEdit.Text;
        ModalResult := mrOk;
    end;
    if (OldFamiliaSearchBtn.Checked) and (OldFamEdit.Text <> '') then
    begin
        pParamNumber := 2;
        pParamValue := OldFamEdit.Text;
        ModalResult := mrOk;
    end;
end;

procedure TAdvancedSearchForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
