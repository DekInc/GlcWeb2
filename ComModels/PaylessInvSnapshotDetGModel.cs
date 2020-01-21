using ComModels.Models.EdiDB;

namespace ComModels {
    public class PaylessInvSnapshotDetGModel : PaylessInvSnapshotDet {
        public int Recid { get { return Id; } }
        public string Categoria { get; set; }
    }
}
