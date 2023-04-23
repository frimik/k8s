local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '8.5', version: '8.5.5' },
];

config.new(
  name='kubernetes-external-secrets',
  specs=[
    {
      output: v.output,
      prefix: '^io\\.kubernetes-client\\..*',
      crds: ['https://raw.githubusercontent.com/external-secrets/kubernetes-external-secrets/%s/charts/kubernetes-external-secrets/crds/kubernetes-client.io_externalsecrets_crd.yaml' % v.version],
      localName: 'kubernetes_external_secrets',
    }
    for v in versions
  ]
)
