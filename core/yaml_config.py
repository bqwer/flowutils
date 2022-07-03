#!/usr/bin/python3
import yaml
from collections.abc import MutableMapping

def flatten(d, parent_key='', sep='::'):
    items = []
    for k, v in d.items():
        new_key = parent_key + sep + k if parent_key else k
        if isinstance(v, MutableMapping):
            items.extend(flatten(v, new_key, sep=sep).items())
        else:
            items.append((new_key, v))
    return dict(items)

class flow_value(yaml.YAMLObject):
    yaml_tag = u'!flow_value'
    def __init__(self, mapping):
        self.comment = mapping['comment']
        self.check_type = mapping['check_type']
        self.value = mapping['value']

    def __repr__(self):
        return "<!flow_value: <comment=%r, check_type=%r, value=%r>>" % (
        self.comment, self.check_type, self.value)

    @classmethod
    def from_yaml(cls, loader, node):
        return flow_value(loader.construct_mapping(node))

#    @classmethod
#    def to_yaml(cls, dumper, data):
#        return dumper.represent_scalar(cls.yaml_tag, data.value)

#    def __init__(self, comment, check_type, value):
#        self.comment    = comment
#        self.check_type = check_type
#        self.value      = value

yaml.SafeLoader.add_constructor('!flow_value', flow_value.from_yaml)
#yaml.SafeDumper.add_multi_representer(flow_value, flow_value.to_yaml)

with open("/home/bqwer/flowutils/core/config.yaml", "r") as stream:
    try:
        yaml_dict = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

flat_dict = flatten(yaml_dict)
