unit uPUB_SP_MOVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpec_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, ExtCtrls;

type
  TFormPUB_SP_MOVA = class(TFormSpec_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPUB_SP_MOVA: TFormPUB_SP_MOVA;

implementation
uses uPrK_Resources,uConstants;

{$R *.dfm}

procedure TFormPUB_SP_MOVA.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_MOVA';
  SelectSQLText        :='Select * from PUB_SP_MOVA_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PUB_SP_MOVA_ADD';
  StoredProcChangeName :='PUB_SP_MOVA_CHANGE';
  StoredProcDelName    :='PUB_SP_MOVA_DEL';
//  NamePrKSpravEdit     := SpecSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPUB_SP_MOVA_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
