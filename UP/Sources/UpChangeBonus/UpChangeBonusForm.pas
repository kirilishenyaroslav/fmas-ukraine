Unit UpChangeBonusForm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
    FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
    uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
    uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
    qFTools, uSelectForm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
    uSimpleCheck, uBoolControl, GlobalSPR{, uShtatUtils},
    Math, Ibase, cxLookAndFeelPainters, cxButtons, cxMemo, cxDBEdit,
    cxContainer, cxTextEdit, AppStruClasses, pFibStoredProc, Placemnt,
    uEnumControl, dxBar, dxBarExtItems, ImgList, DateUtils, cxCheckBox,
    AppEvnts, cxLabel, cxDBLabel, cxCurrencyEdit,
    cxMaskEdit, cxDropDownEdit;

Type
    TfmChangeBonus = Class(TForm)
        KeyList: TActionList;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        CancelAction: TAction;
        BottomPanel: TPanel;
        Reform_Smet: TAction;
        MainOrderDataSet: TpFIBDataSet;
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        GroupBox1: TGroupBox;
    Label1: TLabel;
        Procedure CancelActionExecute(Sender: TObject);
        Procedure OkButtonClick(Sender: TObject);
    Private
         { Private declarations }
    Public
        IdOrder: Int64;
        Constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64); Reintroduce;
    End;

Implementation

Uses BaseTypes, AccMgmt, FIBQuery, UpKernelUnit;

{$R *.dfm}

Procedure TfmChangeBonus.CancelActionExecute(Sender: TObject);
Begin
    ModalResult := mrCancel;
End;

Constructor TfmChangeBonus.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order: int64);
Begin
     Inherited Create(AOwner);
     WorkDatabase.Handle := Db_Handle;
     ReadTransaction.StartTransaction;
     self.IdOrder := id_order;
End;

Procedure TfmChangeBonus.OkButtonClick(Sender: TObject);
Var UpdateSP: TpFibStoredProc;
Begin
     UpdateSP:=TpFibStoredProc.Create(self);
     UpdateSP.Database:=WorkDatabase;
     UpdateSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     StartHistory(WriteTransaction);
     UpdateSP.StoredProcName:='UP_KER_SET_PROCENT_TO_SUM';
     UpdateSP.Prepare;
     UpdateSP.ParamByName('ID_ORDER').AsInt64:=IdOrder;
     UpdateSP.ExecProc;
     UpdateSP.Close;
     WriteTransaction.Commit;
     UpdateSP.Free;

     ModalResult := mrOk;
End;

End.

