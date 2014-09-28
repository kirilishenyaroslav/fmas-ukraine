unit uShtatBonus;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uShtatBonusFrame, ExtCtrls, Buttons, uShtatData, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
    cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ActnList, uFormControl, FIBDatabase, pFIBDatabase;

type
    TfmShtatBonus = class(TForm)
        Panel1: TPanel;
        BonusFrame: TfrmShtatBonus;
        CancelButton: TSpeedButton;
        ActionList1: TActionList;
        CloseAction: TAction;
        Panel2: TPanel;
        procedure frmShtatBonus1CancelButtonClick(Sender: TObject);
        procedure CloseActionExecute(Sender: TObject);
        procedure BonusFrameActionControlAfterRefresh(Sender: TObject;
            Value: Variant);
        procedure BonusFrameShtatBonusViewKeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure BonusFrameActionControlBeforeDelete(Sender: TObject;
            Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
    private
        DM: TdmShtatView;
    public
        DoRefresh: Boolean;

        constructor Create(AOwner: TComponent; Data: TdmShtatView;
            Id_ShtatRas_Smet: Integer); reintroduce;
    end;

var
    fmShtatBonus: TfmShtatBonus;

implementation

{$R *.dfm}

uses UpKernelUnit;

constructor TfmShtatBonus.Create(AOwner: TComponent; Data: TdmShtatView;
    Id_ShtatRas_Smet: Integer);
begin
    inherited Create(AOwner);
    DM := Data;
    DoRefresh := False;

    BonusFrame.Prepare(Data, Id_ShtatRas_Smet);
end;

procedure TfmShtatBonus.frmShtatBonus1CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatBonus.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatBonus.BonusFrameActionControlAfterRefresh(
    Sender: TObject; Value: Variant);
begin
    DoRefresh := True;
end;

procedure TfmShtatBonus.BonusFrameShtatBonusViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    BonusFrame.ShtatBonusViewKeyDown(Sender, Key, Shift);

end;

procedure TfmShtatBonus.BonusFrameActionControlBeforeDelete(
    Sender: TObject; Form: TForm; Mode: TFormMode;
    Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

end.
